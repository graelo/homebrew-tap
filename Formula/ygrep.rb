class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v4.0.3.tar.gz"
  sha256 "b039f3d610094b370e1a1fa4be67406fe09221e6ad36925ec756c6075afb58ca"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-4.0.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "905dbb64ce628fb0d734c5253bdb0bef5873699f2a4eed61e11dc647b1893e78"
    sha256 cellar: :any,                 arm64_linux:  "8c69db3ca2a00815e4464a9a20606adeac4c76d4b60c838bcfbd17a5ba7869d8"
    sha256 cellar: :any,                 x86_64_linux: "58305fea2fa199e2b28a9c4183b0c36c4c6dc6907494d3c79c7d29cbc3850331"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
