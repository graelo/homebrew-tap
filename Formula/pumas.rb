class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "4d11c50bae462ac132d9475ee0b95c6dbadb4814ebef3367051986bbf61f457a"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.9"
    sha256 cellar: :any_skip_relocation, monterey:     "7657d2855ca5b77a82378ecaa9877ae90a3065c9de8a93e7f275f070eb6e1100"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "580cd61b0eaab31209727cfde2a9e739f09e14fdfbf194f436e39fdfc634c470"
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
