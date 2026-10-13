class ToonFormatRs < Formula
  desc "Token-efficient, human-readable format for LLM prompts"
  homepage "https://github.com/toon-format/toon-rust"
  url "https://github.com/toon-format/toon-rust/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "5184701e468819a90e9e23503abc9ed71307c8ab27e578621a956a2174dd1b8a"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/toon-format-rs-0.7.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "283a37154a2c4aaeb86bf5ff75ba0ac6b765c5af0410c3af08d96b4bdee4d298"
    sha256 cellar: :any,                 arm64_linux:  "0aea3bfbb6e1cedf8d8e17f00ccb3478a0c64c30aecbae352ebe7160a78887b2"
    sha256 cellar: :any,                 x86_64_linux: "e897496db3db5575b68bea6e81accac024bd5d1095ae116e5031236126674867"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toon --version")
  end
end
