class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.18.1.tar.gz"
  sha256 "0e21d0a81a72b4b0c81b2daf879381af9a68160b41bdcdb8d3d9395d6229af81"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.18.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "25ff1ecccb575c2aa34d3f6cb9afcac723ec05958b8b9eda8fb86ef6bc0cf609"
    sha256 cellar: :any,                 arm64_linux:  "79d1cca7d2e8258d085ae205276f1ed882764caf0636bf7bd87a79bdd582c136"
    sha256 cellar: :any,                 x86_64_linux: "ddebbd85eae68d7d843d544514ff277fba82f63dc58f0c96c6ea1f656a9d2322"
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
