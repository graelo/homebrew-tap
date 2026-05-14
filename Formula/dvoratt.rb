class Dvoratt < Formula
  desc "Dvorak Typing Practice Terminal App"
  homepage "https://github.com/graelo/dvoratt"
  url "https://github.com/graelo/dvoratt/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "a56d284e1227448b3d207f14e13f6cd7ab0eb7218c16429a548d07f2dead6640"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/dvoratt-0.1.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fdfe015f9a63b8a59a80b611f497666ded5c81512c4179b4c587c56fc5e8ee2e"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "acce1651d329f31cb457d870630b1a2e3834a1f9e792c04734faef168d8b4b94"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "728d2387f03ce686ed03ac6fd025b62a10e7086fe6637cc59952c65501ca2c86"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end
end
