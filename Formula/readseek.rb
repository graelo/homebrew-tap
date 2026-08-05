class Readseek < Formula
  desc "Structural digest for source files, images, and documents"
  homepage "https://github.com/jarkkojs/readseek"
  url "https://github.com/jarkkojs/readseek/archive/refs/tags/0.9.9.tar.gz"
  sha256 "85ececd761e026ca526cf27f5fc7959e2e75952e1e7ccb152d3b8c1919f7d9e6"
  license "LGPL-2.1-or-later"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/readseek-0.9.9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7ce1621e0a84aaad13385d6d77f19dd8242eb8639ee6629bb30bb185be1b66f2"
    sha256 cellar: :any,                 arm64_linux:  "140600e49d4c015dd05941d697c4f1452c1aefd518ecb2ae1df291d6522a6e57"
    sha256 cellar: :any,                 x86_64_linux: "90606edaeba61d26b1f6f15a96f083620558765b7c2a61d570f6d5dd739cdd79"
  end

  depends_on "rust" => :build

  on_linux do
    depends_on "zlib-ng-compat"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "readseek", shell_output("#{bin}/readseek --help")
  end
end
