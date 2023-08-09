class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "7ad27b0bec233352e7382d960b0429e9740212937db46dd8008843ec9b7b9a9d"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "311995d7347827cacc02d50bc59e18540250edf828baf79136c18bce2bc85ea2"
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
