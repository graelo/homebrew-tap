class ToonFormatRs < Formula
  desc "Token-efficient, human-readable format for LLM prompts"
  homepage "https://github.com/toon-format/toon-rust"
  url "https://github.com/toon-format/toon-rust/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "5a07c14cdb62b42420495e5aaa5f194ce273b8e4191f5476e9eb06952af992b0"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toon --version")
  end
end
