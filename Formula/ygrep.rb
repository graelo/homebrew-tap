class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.0.1.tar.gz"
  sha256 "76efd3ee08ea3f6a769916107469d2f177a908d680daed81cf740077b5f50931"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "21352bab2e04e5a71c469a61e03e3880c709887bd257e08ac7b822e68108a417"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "76acb6cfe54932a0aacc9ae95a5acf607f05ef9e9ca695c438e9d10503a47b82"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
