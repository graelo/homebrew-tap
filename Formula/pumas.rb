class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "4d11c50bae462ac132d9475ee0b95c6dbadb4814ebef3367051986bbf61f457a"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.8"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "fa32410698a3f72f06d6ec04cb2d4cc3ee8525751110b792b9094c83f343aa74"
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
