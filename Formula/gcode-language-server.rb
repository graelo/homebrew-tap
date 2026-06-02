class GcodeLanguageServer < Formula
  desc "LSP server for GCode"
  homepage "https://github.com/graelo/gcode-language-server"
  url "https://github.com/graelo/gcode-language-server/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "de6b94ddd8bdb9ad9aba1953f788b955cceb70c6947ab99f81e24a45295b39ad"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gcode-language-server-0.0.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a11cd9d0b7af3865a8c6c2936f87a0122c95b9f8fe00ee4a19290300987cf96a"
    sha256 cellar: :any,                 arm64_linux:   "4b5dffe553efece387813f8ffaa2d4d9dbedd1992922b6df32c2507521cd64d5"
    sha256 cellar: :any,                 x86_64_linux:  "80ee0a5cb6833b6665d0f4de2fc1aea9887ead62cd22727d31c5016ea5d7c90d"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
