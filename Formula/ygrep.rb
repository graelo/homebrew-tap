class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v2.0.4.tar.gz"
  sha256 "052eb2a454a7b477f53c62acbabc27cee31b5b1beb93d1470a59ee9d1c50dd90"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-2.0.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5ff47699109a59546303f3241c4128f9df05631cf3fe98ca56055f3e07b51f73"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "62489c06a9897fbe6ccfe7be9df5072748494964d0078dd745f4e773b86bae8b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
