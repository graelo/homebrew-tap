class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "5ae07f975157c53b70ec8976a5a41e8fadd4d0babbc1fbb7ad30df77fdf47dc1"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b52f7e2639100ab49d86dcc3fb033ee3e256c6ea31f168b5c640184fc0637fff"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c96fbf386ed0c03de17cb9b8b8b6af8b9267fe892e135cd83db34abf8c385ad1"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
