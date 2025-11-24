class Dvoratt < Formula
  desc "Dvorak Typing Practice Terminal App"
  homepage "https://github.com/graelo/dvoratt"
  url "https://github.com/graelo/dvoratt/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "14f3976e75fb2236a44e1632736d25f8e5579a4fe50e1ee8ec54e8fb847b9e76"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/dvoratt-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "606a5e01c203f1094e2474aa87675b8f19a505d724356e1db3fef4c00f62e559"
    sha256 cellar: :any_skip_relocation, ventura:      "8e6a986730996c2e40de7c43d0d979e19d86654776b15787a54cded57de2ddc8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "82f35ff82ceabe8c4ebbfb16920324a4b97d2eed906fc545be0b2dc71a80a656"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end
end
