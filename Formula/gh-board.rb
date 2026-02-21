class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "2cb7acea5ec98b08c2904d3ed3cd09610331329df23c889022e6ffe95a9c98f8"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c853048157d42de9a73e2528b17fd38cac32eaabe5fcf9953ae0c6b4a01562d2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a61f7e2d9d3f783c30ae1ea1379594486cd84243751da7af388fc7571268f060"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
