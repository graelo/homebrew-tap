class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "7c21d43b73de95de0886f5d869351345827f13f486bb5d77642fb78094e2e0e5"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "451afef7da09017aa75cd56454f7dc152973670f27d1867b911d493d83c192a1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1377f93e2ab03a99cea43d74588cc5994de96bafac8652db8e4a5c0b029d8bb8"
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
