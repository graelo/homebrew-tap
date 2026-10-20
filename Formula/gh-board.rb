class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.18.2.tar.gz"
  sha256 "500e71d934c36a03f9d3162ceba87f0f950e40e128c748277720353c2db9d21f"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.18.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6e41c454d4e849df30d86e5b8c5a80d87df00832e31673c2b1efd96741bcb5fc"
    sha256 cellar: :any,                 arm64_linux:  "0abaa441cd41dffd8dc12a61b2c29a7aa7fd5fe77245f60040f3dacdc56fadce"
    sha256 cellar: :any,                 x86_64_linux: "e59a2bf00e934dafbf10b5b6f245159f21bd5f662a7093fbbbd0529ce8e04d65"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "man/gh-board.1"
  end

  test do
    system "true"
  end
end
