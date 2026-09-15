class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.17.4.tar.gz"
  sha256 "baead29380c18e3254415376f3f9a25b828101425f7bc64da48ca8dadf087b12"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.17.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "21e7473271ac1b268af975ff5dcd590e7dc51ebd3b6150e13f2ee94a525614f3"
    sha256 cellar: :any,                 arm64_linux:  "fb18b6ed871a900cf25905d9d002878f5e3d9b19ff76a70b7e0b5a3931626f7b"
    sha256 cellar: :any,                 x86_64_linux: "5ead020fd603a16056e8d4ab9459a011a2c5e649566d8aebbb4fb020c26b1f05"
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
