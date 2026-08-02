class Obscura < Formula
  desc "Open-source headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"
  url "https://github.com/h4ckf0r0day/obscura/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "736480d0b540f0083dc01eeb1df5faa03451fc31bb2caaa62742a88b9b00c736"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/obscura-0.1.11"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c2e1d6518c3cfae9395649e5975f2da26e1692f7d473541d07a4efb4a5fc3dad"
    sha256 cellar: :any,                 arm64_linux:  "e68f67794a09abff1968cacd1fe6d3457913e84c594af16583514fa7b28d8a22"
    sha256 cellar: :any,                 x86_64_linux: "71a7d1f126794c5488cf6448f4b5c5937cafee0c512960db3a88faa029649a91"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/obscura-cli")
  end

  test do
    assert_match "fetch", shell_output("#{bin}/obscura --help")
  end
end
