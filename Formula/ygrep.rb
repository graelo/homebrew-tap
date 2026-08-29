class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v4.0.1.tar.gz"
  sha256 "cf722e52158f50523dd6b3b5cd0b152ded207aeead08c84af37b2099940790ca"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-4.0.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "64d907dc13cc595a3535c5bd3adb725b070ea55750a5a3d89d6ad7a7343ea0c9"
    sha256 cellar: :any,                 arm64_linux:  "56059ac33d264193816284aeb530752a6f59ea211469b8cfa851046f0086704d"
    sha256 cellar: :any,                 x86_64_linux: "1d1473ecde629e854ba6666ce734382733ed79ef502d5ebaaca06408ce0d4e3f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
