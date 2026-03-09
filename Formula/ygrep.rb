class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.2.4.tar.gz"
  sha256 "b50e96926d2e610560c291d031d0e6152938679486a7e2cc922b5e2fe21e6272"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.2.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b2dc1dccf99a22b8432ab79ca40ebe728abf2165fbbfab2d2fe9b525520b7d11"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ec6c821a1f0ae2309cf9c17bd1193799897aa5a1d6456a235fb61d3931eaca2b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
