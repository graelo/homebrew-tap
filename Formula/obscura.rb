class Obscura < Formula
  desc "Open-source headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"
  url "https://github.com/h4ckf0r0day/obscura/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "6c448e4c1deac7e057a146f53005c825ded428fb642379911a04f5dda8eaca4f"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/obscura-0.2.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1384190df1333b184bdf8a134f433002903aa13fa274f87bddc86f19a6fb173a"
    sha256 cellar: :any,                 arm64_linux:  "a808843b7770085b34c66f1e102051f82bbb16b315304033bebfcd20f53f5d37"
    sha256 cellar: :any,                 x86_64_linux: "1502001fa27946a1a6d970d989073215c245f9163715051d4f7f6978e73ede65"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/obscura-cli")
  end

  test do
    assert_match "fetch", shell_output("#{bin}/obscura --help")
  end
end
