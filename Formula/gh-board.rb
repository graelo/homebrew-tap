class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.17.2.tar.gz"
  sha256 "478585908daadc985808a893946cdd7a852305f2a2e2404d264c170cbc3a784d"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.17.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7fa1a42a751d3f4b399d377de78ecff21fd90cb9012cd8b82949424895a83cf5"
    sha256 cellar: :any,                 arm64_linux:  "89adcc460a22da68e484b40edff7913dbe3bde52cf6dbe72aa0de2c1f8252c4c"
    sha256 cellar: :any,                 x86_64_linux: "1b29c23bbb4eee4dab6631f7d7b1a43200927a4e4614c82451e550662268253c"
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
