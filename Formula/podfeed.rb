class Podfeed < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podfeed"
  url "https://github.com/graelo/podfeed/archive/refs/tags/v0.3.6.tar.gz"
  sha256 "306403ba1f9fccf2c2274c1aa2175d289da40875011082074da8d7e5a9c83d40"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podfeed-0.3.6"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1c547618f1fcfe32d1f511b3a9834c23351b8263ac64157274c0bd7b90de260b"
    sha256 cellar: :any,                 arm64_linux:  "871ad34c26315e616ccae03f941c3e2a95e39cd0404d726bddcb150745885c4f"
    sha256 cellar: :any,                 x86_64_linux: "41aa99d47a01f4aa26347e771e8089f171e1fddd8b65312aef2d83f86ad6f280"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"podfeed", "generate-completion")
  end

  test do
    assert_match "#compdef podfeed", shell_output("#{bin}/podfeed generate-completion zsh")
  end
end
