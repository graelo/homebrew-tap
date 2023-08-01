class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "4d11c50bae462ac132d9475ee0b95c6dbadb4814ebef3367051986bbf61f457a"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.9"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "2b54c4e8a6030081c8d10dc4803d831570fda9c913070533645f4aac8ff42e6c"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"pumas", "generate-completion")
  end

  test do
    assert_match "#compdef pumas", shell_output("#{bin}/pumas generate-completion zsh")
  end
end
