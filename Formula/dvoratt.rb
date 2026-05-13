class Dvoratt < Formula
  desc "Dvorak Typing Practice Terminal App"
  homepage "https://github.com/graelo/dvoratt"
  url "https://github.com/graelo/dvoratt/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "a56d284e1227448b3d207f14e13f6cd7ab0eb7218c16429a548d07f2dead6640"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/dvoratt-0.1.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "38304235f98dc4baa360f0a6f5d2b5408f13484c2b34ed8dda2366d2e8dfe195"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "112cd01570b3b563daf912e9af69a801ea9e1408885522a1224081b3ffcdb373"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "912f7421cd0cb4f897000e04b3505f343b40caec2ca372ad3cea672d9141cf5d"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end
end
