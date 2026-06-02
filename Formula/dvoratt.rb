class Dvoratt < Formula
  desc "Dvorak Typing Practice Terminal App"
  homepage "https://github.com/graelo/dvoratt"
  url "https://github.com/graelo/dvoratt/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "ab880c47da488043d25f9f304131e46078c579c0322ec1b4e779d9af12ea8d01"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/dvoratt-0.1.7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "de94bd5179c447e130a6235a7a3e0711ed970ade3a48a021d00304f4576ddf3d"
    sha256 cellar: :any,                 arm64_linux:   "b8855a17ab7a55f16c82d3af6622ac89e0617420de30f2b60f04fa4b4a33532e"
    sha256 cellar: :any,                 x86_64_linux:  "9b2664d4aae593a986a6aa610541072e7812fef2b6757189c8ed599a344523c8"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end
end
