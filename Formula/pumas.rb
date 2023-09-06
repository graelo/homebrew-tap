class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "50879e5b30fe20de22055d12d1382276396eea36b94b9666e108abc4457c8c83"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.1.2"
    sha256 cellar: :any_skip_relocation, monterey:     "952fa60ad06ef14d7cd592e83b57996e6ddac9016e5e2a3f0dfc0f06c732da0f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "35370931044dc0a2338836f2679da48e624b6d85902cb4b6ea7fb7eb8ce8b62f"
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
