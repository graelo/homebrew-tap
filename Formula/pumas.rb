class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "7c21d43b73de95de0886f5d869351345827f13f486bb5d77642fb78094e2e0e5"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.2.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c87ab37b6b9dfacbbce3fb3c9289fbc04cc37948f2bef6d691b9719588dd95d1"
    sha256 cellar: :any_skip_relocation, ventura:      "fd2feaaf422a76d99c2cc70392f8bf1d94c90e8d793826eb583b99c05d70dbd7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f4218a3f1c2a633230dcd83dc0cab4c28e03d6a43f2e8ffecb08ec49614bd5dd"
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
