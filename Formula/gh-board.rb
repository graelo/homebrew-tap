class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.17.3.tar.gz"
  sha256 "95b264de3a1f8f42b941a6c12d95642a00b5093df15e14b8b4f9f255feb6ac9b"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.17.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a3bfded9ba670deb61e3ad96ff0dca19918884c2b6df4bc00017646d7e0138e8"
    sha256 cellar: :any,                 arm64_linux:  "d7abc4fd41934f042618f6e7bdb057d7b16ad4decfbf2f9a95437cdae30294b9"
    sha256 cellar: :any,                 x86_64_linux: "de804791dd83521f143f02886bb756ff5ed87117839dd79c178a6c6e7b978e4c"
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
