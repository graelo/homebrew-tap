class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "c73627695434e348657a74fc937cbad349e7220b7d9a76e641a9236ea070cf50"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.10.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c3a5d191cdeb0ff32f15e5e6985f9f08fe9f1c974394bba9b9d49817e90e8591"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "1131b5faa5f965495be4563a3ad2ee8047d1e12cafbd743aea9373d40b8affe2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "01e3404dc75fd663ec8f6b8205290e5f248b98e80c360b63fdc19089504aeb72"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
