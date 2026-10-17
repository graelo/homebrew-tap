class Obscura < Formula
  desc "Open-source headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"
  url "https://github.com/h4ckf0r0day/obscura/archive/refs/tags/v0.2.5.tar.gz"
  sha256 "af287fa7658270a68ad6f1220197eb55035614a91b14295117da78e55494958a"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/obscura-0.2.5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "bf42a060326ebf0d7376822f1a01ab76d674313c78236788f398ed1333bc0bc8"
    sha256 cellar: :any,                 arm64_linux:  "e8e9572352fd2d4d07d15f202ffd5d547cb6b8b99d62655a134b479ba510b16b"
    sha256 cellar: :any,                 x86_64_linux: "29364d918aadc6c6c466ce130903b057a8d7db79d933350f1fca59aeb2dc3d46"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/obscura-cli")
  end

  test do
    assert_match "fetch", shell_output("#{bin}/obscura --help")
  end
end
