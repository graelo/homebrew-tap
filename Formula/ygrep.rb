class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.1.2.tar.gz"
  sha256 "14d8cbc8161d51a851dee8f124eec0ac9ac28d42d1e262c2072f746c37a5ed06"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "15731240e231bdca6513544ce17a1960d6e3be81bbc72338b40b83c8eb8eb0c3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bf0c13735cc9a6bffe2fa364fc9f28d8722f3772d173b7858e0ad5fd9ab0d605"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
