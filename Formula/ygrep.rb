class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.1.5.tar.gz"
  sha256 "14f960fa594232604c1cda5a4ffb3b157a70d6f84591e7b791d06b255804d2ee"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.1.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7898b786e6b743f00db029eae9d2d8af1e6ea77e222bf6054ee8e84477803667"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2652667872f86cafe3b6576192a635587a05f9bd0e37fb0644c8fa336c08e8ac"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
