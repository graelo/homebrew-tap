class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "a7c2e7f70da01e94a76a93f81a1ebf8b958175783b307120feb2a6fa953ef531"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "63e93f86a277a01622064ba671c7da3322927ebb8f3f0cfbaf9cb0142e370957"
  end

  depends_on "rust" => [:build, :test]
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"pumas", "generate-completion")
  end

  test do
    assert_match "#compdef pumas", shell_output("#{bin}/pumas generate-completion zsh")
  end
end
