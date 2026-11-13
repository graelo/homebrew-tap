class Obscura < Formula
  desc "Open-source headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"
  url "https://github.com/h4ckf0r0day/obscura/archive/refs/tags/v0.2.7.tar.gz"
  sha256 "6e6da68d8f630973394d7f1319779edb1f1f3e19590940291c947a3601892155"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/obscura-0.2.7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "fb3413690cb362e1543307184d46d381b6219c07e847a72a04af623529088a76"
    sha256 cellar: :any,                 arm64_linux:  "14d8252de4c9116eca6300a1ce9de302d75359a4c1520f42472c6cb383c4472e"
    sha256 cellar: :any,                 x86_64_linux: "d69fb8d10f248725af2113a45e50e1d01a4ba105cca5f108bc36d727e2df7fbf"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/obscura-cli")
  end

  test do
    assert_match "fetch", shell_output("#{bin}/obscura --help")
  end
end
