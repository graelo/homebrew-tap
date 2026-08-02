class Obscura < Formula
  desc "Open-source headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"
  url "https://github.com/h4ckf0r0day/obscura/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "92573128994403b54644089e61432d940eef1b0e3312c7c0543f1d0b4b155112"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/obscura-0.1.10"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "76b370c3ffbadff2003bdcbc45d04353a7b82cb6e6c7d7f434322a07456070d6"
    sha256 cellar: :any,                 arm64_linux:  "8efbe56c11830add0e90af34b466e7c59f4603f018eaa319d7a0f1632a69ecdd"
    sha256 cellar: :any,                 x86_64_linux: "418dde8c1eb6f7304d4aba142b7ed0f13db5eb670a2df9c571ccf4849be055a4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/obscura-cli")
  end

  test do
    assert_match "fetch", shell_output("#{bin}/obscura --help")
  end
end
