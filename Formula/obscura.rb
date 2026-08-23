class Obscura < Formula
  desc "Open-source headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"
  url "https://github.com/h4ckf0r0day/obscura/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "8572780dca68d49090bd46ee124a9195fdec75b18ee96b782f8da09490bfe0d1"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/obscura-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e58d09726467bfd71a9c8231a7da73cb5bd085da0f928ed940f1c9ff14123940"
    sha256 cellar: :any,                 arm64_linux:  "f89c7b16528d8e8cd82a66c1d4f57b164e92744711403f6eeb958e183e1ba71f"
    sha256 cellar: :any,                 x86_64_linux: "0c0943dd31d46aaa7b0e29b483d1f8d6379d30e7da5891ec612b5e4210040e79"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/obscura-cli")
  end

  test do
    assert_match "fetch", shell_output("#{bin}/obscura --help")
  end
end
