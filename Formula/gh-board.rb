class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.18.4.tar.gz"
  sha256 "c309b5a55cf29a04def5beb412b1d7af784c2cc32a3c5daa28d63f32deb5b4fa"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.18.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6197a5494eeb44566f806d31ab9255265c8c1d5e29543aa130b68684238903ac"
    sha256 cellar: :any,                 arm64_linux:  "5252a64f1b0f639af6d155c45e1962524d84290361106fb5df3a09ea8bbbb3e6"
    sha256 cellar: :any,                 x86_64_linux: "6d671f664fa82daadc1f1ec980d5b3f00db940c9357a9ffbba6c70ace7a1811b"
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
