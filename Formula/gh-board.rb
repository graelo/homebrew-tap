class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "93faf865d161aeb91b999a06dbaab31b4525327c35c3ba1225db5b5d115f6e62"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.12.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0ee152a163683284ec99a6bdaae40e736f1278c47cd7e1bea01cfcf8e9a75efa"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "29001a50915dcd3526f7b59cd52e136bccf577486f1ec871f8075045301fd65e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7b323d7837864d1c6220b96449d2ef8fa8872fb6ce5a11b831c63b1d7d888a88"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
