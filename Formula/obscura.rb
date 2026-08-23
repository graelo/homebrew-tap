class Obscura < Formula
  desc "Open-source headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"
  url "https://github.com/h4ckf0r0day/obscura/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "8572780dca68d49090bd46ee124a9195fdec75b18ee96b782f8da09490bfe0d1"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/obscura-0.2.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c8a914da150f72d20c8129bbdf800dfe82908939606e725f32388711baf6024b"
    sha256 cellar: :any,                 arm64_linux:  "b3f56fa2640ec0e5da5ab3bdc44871e29af810048556a64d606d9f26115e70db"
    sha256 cellar: :any,                 x86_64_linux: "687256eeaebb478f13acf66c461787b37733f827e531e5297da94e77d37a4364"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/obscura-cli")
  end

  test do
    assert_match "fetch", shell_output("#{bin}/obscura --help")
  end
end
