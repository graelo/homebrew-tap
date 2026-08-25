class ToonFormatRs < Formula
  desc "Token-efficient, human-readable format for LLM prompts"
  homepage "https://github.com/toon-format/toon-rust"
  url "https://github.com/toon-format/toon-rust/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "5a07c14cdb62b42420495e5aaa5f194ce273b8e4191f5476e9eb06952af992b0"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/toon-format-rs-0.5.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0b7537efb7e24cb9987058906fe26814871971f5a1ab2bcb05d2f176cd748784"
    sha256 cellar: :any,                 arm64_linux:  "83b3f1c553f88a640d6bc7fd160d143f5ed13c8ca6ad36eaec573126c7570985"
    sha256 cellar: :any,                 x86_64_linux: "859b053c16666a9691af32abda814c983dd60d3f474a5e738a1265928b55a817"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toon --version")
  end
end
