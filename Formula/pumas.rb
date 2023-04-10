class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "cb245df92d9c24757194d33c7cf0370fee917b72afbf58dd95db9c5b7e96a51a"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.3"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "6a3a737f1a3b50067d3537d6548acb32ef3a70fb2144cc4fb14d6bc14eba27ad"
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
