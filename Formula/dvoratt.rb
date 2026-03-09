class Dvoratt < Formula
  desc "Dvorak Typing Practice Terminal App"
  homepage "https://github.com/graelo/dvoratt"
  url "https://github.com/graelo/dvoratt/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "9bb5e2c40e49feb0a775997c6835410a17eeed292d228d0da9c81508731b5b3b"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/dvoratt-0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6b00b0bf9e41310ecf951cb0a13108ce7f4aeaf2763f401cf59136962b86cfd1"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "180c18f4c7d99155e3c2e936e532114541eb8f236a39fca6cba47a4fa365bf0a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3702de86568d91fb8ddc745e6661bae3ba88aacfc3b1da8f70e7fb4127f7f224"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end
end
