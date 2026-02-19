class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.1.2.tar.gz"
  sha256 "14d8cbc8161d51a851dee8f124eec0ac9ac28d42d1e262c2072f746c37a5ed06"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2f4eba7c3fb8528d6fc50959c2d9099378ce93037a3469ee2272a2d441eb29b1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "cecb99eeace14574b8b0fa040b4e51986f1bb4ffe47c5adf72a82da26fad8071"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
