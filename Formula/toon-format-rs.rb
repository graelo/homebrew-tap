class ToonFormatRs < Formula
  desc "Token-efficient, human-readable format for LLM prompts"
  homepage "https://github.com/toon-format/toon-rust"
  url "https://github.com/toon-format/toon-rust/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "4a4479bad7fe7d081585f958f7de5c078205a2851bbfaf1068174b46b927ec29"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/toon-format-rs-0.6.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "364e8c32fbf47718f781c231ce937ef66355006b80f9d95a7ddc41d5e45bd83f"
    sha256 cellar: :any,                 arm64_linux:  "df0325822fe3f68b195d5e9ae3243fe8c4e9efd4dba44be2378a0c143e51086f"
    sha256 cellar: :any,                 x86_64_linux: "c60388cc0b75c5ae8dd3b6f6f4133a3ba7e7e0a64d28e96a654565998973cfba"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toon --version")
  end
end
