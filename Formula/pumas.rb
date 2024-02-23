class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "c6eeec77fc6bcec84c27f86deef9505a66c4d20405173f68f5006f80320bda41"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6dd4ec185ce6f895aff7e27b3c3d63dd100b3ea422b6e489d6617483caf6fe75"
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
