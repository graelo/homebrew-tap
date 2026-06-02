class Tik < Formula
  desc "Count LLM tokens in text files"
  homepage "https://github.com/graelo/tik"
  url "https://github.com/graelo/tik/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "e460541eef9e2c639d74c1ec376327242ba74e107a7e156e0719a17893e75f2c"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tik-0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7184c7a400fbea127227b4432f08e7493ba931334cbc20a3076f1cf124ebaf63"
    sha256 cellar: :any,                 arm64_linux:   "00244e0df321add14465f307bf662bde1cc64a199e1bbc6c2efc559cbd58e6f5"
    sha256 cellar: :any,                 x86_64_linux:  "9e36eced7ef73e610a452933aae8d585519ab6bf8ff14b4c253eb6265d27ac5c"
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
