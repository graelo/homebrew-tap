class Obscura < Formula
  desc "Open-source headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"
  url "https://github.com/h4ckf0r0day/obscura/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "6c448e4c1deac7e057a146f53005c825ded428fb642379911a04f5dda8eaca4f"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/obscura-0.2.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7c8efa3110fc55d5ebb8b45a333743ec48a07a9bed9269dfb0afd68815d00b1f"
    sha256 cellar: :any,                 arm64_linux:  "5646ae51c7bc924b5c1132fe2b83d83adeb814039c89ee5c1e884619cd016555"
    sha256 cellar: :any,                 x86_64_linux: "eb6747e65655c702420f3d40c967dd5fcdfea4ba1c4be540ef251955445a6d6b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/obscura-cli")
  end

  test do
    assert_match "fetch", shell_output("#{bin}/obscura --help")
  end
end
