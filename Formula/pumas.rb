class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.2.5.tar.gz"
  sha256 "4dd0a55457c920447137f4b277c8961e7f618e9a66f3f1272980b0564e79a8ab"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.2.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "009de46a95cb625ad1e634bbbf36fc1ba0173bf1755fe6ef716eff27eec7a4be"
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
