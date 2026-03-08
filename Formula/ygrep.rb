class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.2.2.tar.gz"
  sha256 "bcc1dc4c1cfe7de09c647bb59d0e521081e8e04f4013199440e6bbf57c2fc4bc"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.2.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "239e0ffbfbbc5a63a37b89ebd550d3d9dcb7db16b46ac1474a6cb07302715515"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6a7932854cef0014055709d9b6d191d62ea4513c3b1d2a6e0c5b7510b7d78498"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
