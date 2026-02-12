class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "78db09c7af2b2402ddb0561da15c7fa273719abbe2751fbdf611199f5acd775b"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-2.0.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3ed29a167905c42ae0b3d2e7042a854ddc85198bfa180b39c7ec9f9f6171a294"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a48e3ca9af06894995f00cff191da3e628b25fe2030ae5019d5e8611ac17f89b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
