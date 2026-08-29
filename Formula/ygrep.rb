class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v4.0.1.tar.gz"
  sha256 "cf722e52158f50523dd6b3b5cd0b152ded207aeead08c84af37b2099940790ca"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-4.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "beafbb92e69f5dd740fccf9df04b45ee95da626bb4977ec67edff85f839f532d"
    sha256 cellar: :any,                 arm64_linux:  "a238277aa710478c1d773778b2672c2feaf4d630ae9850dd57426840651cc9d2"
    sha256 cellar: :any,                 x86_64_linux: "2043e096e0565b2be905adca330dc2b558c7ece5b6392e0693880744a7fad141"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
