class Dvoratt < Formula
  desc "Dvorak Typing Practice Terminal App"
  homepage "https://github.com/graelo/dvoratt"
  url "https://github.com/graelo/dvoratt/archive/refs/tags/v0.0.0.tar.gz"
  sha256 "60918deeb68a9f0b614581acc788b9aca720696f1cefebe2922b253e4c11f46f"
  license "MIT"

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end
end
