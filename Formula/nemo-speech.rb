class NemoSpeech < Formula
  desc "Speech recognition, diarization, and speech-LLM transcription with NeMo"
  homepage "https://github.com/NVIDIA/NeMo-Speech.cpp"
  url "https://github.com/NVIDIA/NeMo-Speech.cpp/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "05f4a3d4079660541201ae43d942a7ed0e084639988d297eb0849e120904a0b9"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "abseil"
  depends_on "sentencepiece"

  # CPU builds apply upstream's ggml/llama.cpp patch series at configure time,
  # which needs git.
  on_macos do
    on_intel do
      depends_on "git" => :build
    end
  end
  on_linux do
    depends_on "git" => :build
    depends_on "patchelf" => :build
  end

  # The release tarball does not vendor submodules. llama.cpp (which also
  # provides ggml) is the only one this build needs; stage the exact commit
  # pinned by upstream's submodule into the source tree before configuring.
  # Keep this pin in sync with upstream's llama.cpp submodule when bumping.
  resource "llama.cpp" do
    url "https://github.com/ggml-org/llama.cpp/archive/bd4f514db14d87fded667787a7a963bfbaa98e89.tar.gz"
    sha256 "b02af830447d56db65f6579414dee3c06d9d116cc1765d2539417ee8a7ff1dfa"
  end

  def install
    resource("llama.cpp").stage(buildpath/"llama.cpp")

    # Smallest upstream-supported configuration that keeps ASR, diarization,
    # and speech-LLM (SALM) transcription: metal-server/cpu-server presets
    # minus TTS, NMT, and HTTP serving.
    args = %w[
      -GNinja
      -DNEMO_SPEECH_BUILD_ASR=ON
      -DNEMO_SPEECH_BUILD_DIAR=ON
      -DNEMO_SPEECH_BUILD_SPEECHLM=ON
      -DNEMO_SPEECH_BUILD_TTS=OFF
      -DNEMO_SPEECH_BUILD_NMT=OFF
      -DNEMO_SPEECH_BUILD_S2S=OFF
      -DNEMO_SPEECH_BUILD_HTTP=OFF
      -DNEMO_SPEECH_BUILD_GRPC=OFF
      -DNEMO_SPEECH_BUILD_MIC_CAPTURE=OFF
      -DNEMO_SPEECH_BUILD_EXAMPLES=OFF
      -DNEMO_SPEECH_BUILD_TESTS=OFF
      -DNEMO_SPEECH_BUILD_TOOLS=OFF
      -DBUILD_TESTING=OFF
      -DGGML_LLAMAFILE=ON
    ]
    # ggml auto-detects ccache/sccache as a compile launcher, which breaks
    # under Homebrew's sandboxed build environment.
    args += %w[-DGGML_CCACHE=OFF]

    # Upstream metal-* presets build the pristine llama.cpp submodule (the
    # patch series targets CUDA and CPU-only optimizations). Metal kernel
    # sources are embedded and compiled at runtime, so no Metal toolchain
    # is needed at build time. Upstream cpu-* presets keep the ggml/llama.cpp
    # patch series applied.
    args += if OS.mac? && Hardware::CPU.arm?
      %w[-DGGML_METAL=ON -DNEMO_SPEECH_GGML_PATCHED=OFF]
    else
      %w[-DNEMO_SPEECH_GGML_PATCHED=ON]
    end

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    # Upstream installs its vendored ggml/llama.cpp runtime libraries under
    # lib/ with the same file names as Homebrew's ggml/llama.cpp formulae.
    # Keep this formula's copies private and point its own binaries at them,
    # so both formulae can be installed and linked at the same time.
    vendored = libexec/"lib"
    vendored.mkpath
    lib.children.select { |f| f.file? && f.basename.to_s.match?(/\Alib(ggml|llama)/) }.each do |f|
      mv(f, vendored)
    end
    rpath = OS.mac? ? "@loader_path/../libexec/lib" : "$ORIGIN/../libexec/lib"
    # Versioned dylibs have unversioned symlinks; deduplicate by realpath so
    # each file is rewritten once.
    consumers = ([bin/"nemo-speech"] + lib.children.select do |f|
      f.file? && f.basename.to_s.start_with?("libnemo_speech")
    end).map(&:realpath).uniq
    consumers.each do |consumer|
      if OS.mac?
        require "macho"
        macho = MachO.open(consumer)
        macho.add_rpath(rpath)
        macho.write!
        MachO.codesign!(consumer)
      else
        system "patchelf", "--add-rpath", rpath, consumer
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nemo-speech --version")
    assert_match "transcribe", shell_output("#{bin}/nemo-speech --help")

    # `doctor` reports compiled features and ggml devices. It exits non-zero
    # when a compiled-in GPU backend finds no device (e.g. a headless
    # runner), so do not assert on its exit status.
    require "json"
    doctor = JSON.parse(pipe_output("#{bin}/nemo-speech doctor --json"))
    assert_equal true, doctor["features"]["speechlm"]
    assert_equal true, doctor["features"]["diarization"]
    assert_equal true, doctor["features"]["backend_metal"] if OS.mac? && Hardware::CPU.arm?
  end
end
