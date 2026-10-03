class Tik < Formula
  desc "Count LLM tokens in text files"
  homepage "https://github.com/graelo/tik"
  url "https://github.com/graelo/tik/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "435edc64a53dbeda3fc05a878b9ff420b4a40db9242c8aff555fa665ce789775"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tik-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "84a67ba2b2a0ab4773d8f162e22dd9f9b33bd56496df74ea4898c8a72f7785e8"
    sha256 cellar: :any,                 arm64_linux:  "85da91b6e7c1ac859a4067911ee0b9cd153dcd04cbb93b6661da1f3e0b61482b"
    sha256 cellar: :any,                 x86_64_linux: "16410709816a68abd4bc8924599b41b3feaee0ce2ef7a523237e7f46788b78a5"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"tik", "generate-completion")
  end

  test do
    assert_match "#compdef tik", shell_output("#{bin}/tik generate-completion zsh")
    assert_equal "2\n", pipe_output("#{bin}/tik", "hello world")
  end
end
