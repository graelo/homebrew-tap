class Dvoratt < Formula
  desc "Dvorak Typing Practice Terminal App"
  homepage "https://github.com/graelo/dvoratt"
  url "https://github.com/graelo/dvoratt/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "eb814ecff8450b83e08f674f3c9ea45f44de34c1ba8cce005e24f987bdf5bba1"
  license "MIT"

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end
end
