class Dvoratt < Formula
  desc "Dvorak Typing Practice Terminal App"
  homepage "https://github.com/graelo/dvoratt"
  url "https://github.com/graelo/dvoratt/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "ab880c47da488043d25f9f304131e46078c579c0322ec1b4e779d9af12ea8d01"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/dvoratt-0.1.7"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "480b7c19f504cacbd7365deaebe3d0137036a2a66b6729a99fb90e438983b07b"
    sha256 cellar: :any,                 arm64_linux:  "587c508c33b200088df327223d2733b58c2e6a67b611fe9e67a008db190ee9f5"
    sha256 cellar: :any,                 x86_64_linux: "d8489411b1beadb4185b7b5f765784aa3fa9a883b515e6b349dd44035c04c4a8"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
