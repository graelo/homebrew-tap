class Dvoratt < Formula
  desc "Dvorak Typing Practice Terminal App"
  homepage "https://github.com/graelo/dvoratt"
  url "https://github.com/graelo/dvoratt/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "71d6191578559981bf4a60f4f7873db1acd7861838a5783b2cc1b1f260e1112d"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/dvoratt-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "69aa250549712a5d7c5ff394f223f9c799baab1d67e7f8005f24810cb0a48197"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "603f4f785d9b77a928b2b1c6104fd146d810785eb4da5dcb3c39e5dd634204af"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end
end
