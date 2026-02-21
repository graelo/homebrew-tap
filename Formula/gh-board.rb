class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "2cb7acea5ec98b08c2904d3ed3cd09610331329df23c889022e6ffe95a9c98f8"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "64fc0b75e2a0e10715badd220583a53bcd251bbba08160d492974617393ff3bc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f4189c59c5acb6bf8a0f599b3221189c29ec24d643ac48ed5ddd199ddef0e3ab"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
