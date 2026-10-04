class Obscura < Formula
  desc "Open-source headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"
  url "https://github.com/h4ckf0r0day/obscura/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "e8cfbad9025bd79d4f22da55e2c0f9111b8a082b821805f258c6be2594f25111"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/obscura-0.2.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1b5ccbf72bdbde52bec7d7fff831bf33612d5f9ad3ec76512aff0b5c9878be09"
    sha256 cellar: :any,                 arm64_linux:  "9e3118e49f3372e5b4fe626d6fca4883c8abc721b2f7796341412761bea580d6"
    sha256 cellar: :any,                 x86_64_linux: "40c0b66f31c9364526d2120b265c1b6640287b7952287bcc81deb7affe7cb388"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/obscura-cli")
  end

  test do
    assert_match "fetch", shell_output("#{bin}/obscura --help")
  end
end
