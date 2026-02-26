class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.1.6.tar.gz"
  sha256 "062f2d52571182bd90c0aa276905a03e6bf4f954752066e1b7bd4e28105d6d50"
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
