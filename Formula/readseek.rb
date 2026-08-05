class Readseek < Formula
  desc "Structural digest for source files, images, and documents"
  homepage "https://github.com/jarkkojs/readseek"
  url "https://github.com/jarkkojs/readseek/archive/refs/tags/0.9.9.tar.gz"
  sha256 "85ececd761e026ca526cf27f5fc7959e2e75952e1e7ccb152d3b8c1919f7d9e6"
  license "LGPL-2.1-or-later"

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
