class Tik < Formula
  desc "Count LLM tokens in text files"
  homepage "https://github.com/graelo/tik"
  url "https://github.com/graelo/tik/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "PLACEHOLDER"
  license "MIT"

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
