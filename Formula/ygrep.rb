class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v2.0.4.tar.gz"
  sha256 "052eb2a454a7b477f53c62acbabc27cee31b5b1beb93d1470a59ee9d1c50dd90"
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
