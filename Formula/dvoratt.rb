class Dvoratt < Formula
  desc "Dvorak Typing Practice Terminal App"
  homepage "https://github.com/graelo/dvoratt"
  url "https://github.com/graelo/dvoratt/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "9bb5e2c40e49feb0a775997c6835410a17eeed292d228d0da9c81508731b5b3b"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/dvoratt-0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0a1efcf2d326c86c0b5cb5a785767e2f347fcf2599b64219594b6a17e2b85412"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "708d791bb96232e66f4c1889cd18563ced9a73e8f2bec25775c6bb4f66591dc7"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end
end
