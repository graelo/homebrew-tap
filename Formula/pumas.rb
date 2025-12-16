class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "a4e9ec26bd5c9720e352b2755867fd28e12fd2461d1ecf27147c7f6f1aac8689"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.3.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b1b61b4fcdc5313b247dcb7cd4e2b24c8c3b419766b42abe4415d63b775cb792"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5fcb012c2af11bf45fbc9db3f522b8946b2032e3df3bdfdf6435186e3c7a49c0"
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
