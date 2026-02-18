class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.0.5.tar.gz"
  sha256 "3e4d2349bd39c4f1d78c6cc43d6902a13531a1e5d9d78aa2e3dd12d93604bd6b"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.0.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8053b312f7b90a13be31dc55b9347422302e6b7fb3e7876f7205f3e37bb0de32"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4266964f00260996a82e0f11a437887bca09755a6d74c7e66c118a51e8690c73"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
