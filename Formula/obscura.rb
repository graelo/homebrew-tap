class Obscura < Formula
  desc "Open-source headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"
  url "https://github.com/h4ckf0r0day/obscura/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "809fbe7636a755e426257bb1c0fbbd390316f78026bfc468f4d483db7b31c07c"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/obscura-0.2.6"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1a1f26b78a88b051fd4ccd4fcc9bfc674d042951cbfdcc0b5abc603b2096948a"
    sha256 cellar: :any,                 arm64_linux:  "bd7972caabcd3817a4aac52f981cb93b2b8983bea2e4c9948cac33ac6d4554f9"
    sha256 cellar: :any,                 x86_64_linux: "9a31fdcf50ad95598db0401bb2bee1401d33d1188f4ec36acf0762137f8ea387"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/obscura-cli")
  end

  test do
    assert_match "fetch", shell_output("#{bin}/obscura --help")
  end
end
