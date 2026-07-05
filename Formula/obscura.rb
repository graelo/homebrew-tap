class Obscura < Formula
  desc "Open-source headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"
  url "https://github.com/h4ckf0r0day/obscura/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "a74a357388a3fc61e9c992b93907e9358e2bfb6fbaba567cf25eaa0f2b646894"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/obscura-0.1.9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a7fcc7c91442cb0138a1bfa6387ddda9815bca1ec062431c95b6004a7b51fed4"
    sha256 cellar: :any,                 arm64_linux:  "89fc24203c664693c81d4e8245f32ed740ef4f986534398f25994c02112a8a06"
    sha256 cellar: :any,                 x86_64_linux: "6983054f6ac8bc3c86f933b1b79f0404b2cb1d13780d3b8847340f8a0a68be28"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/obscura-cli")
  end

  test do
    assert_match "fetch", shell_output("#{bin}/obscura --help")
  end
end
