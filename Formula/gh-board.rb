class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.17.1.tar.gz"
  sha256 "bdb618c152fc12cf920fbec7be9548bc9d7011274a81b28df517e269efa03ecf"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.17.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e84154ac4d87c96d634496e92d85dd88af01f4cdca8be4a6d0876d4d90f48287"
    sha256 cellar: :any,                 arm64_linux:   "81938649012cdeeb8fa72cea922c6087a9bbffe9fd83f5786ee0666b3850c15a"
    sha256 cellar: :any,                 x86_64_linux:  "c9b9fe054ec0e66c34eb588786a9acfcc6da0850e93131dc0925135e0a9c98d7"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
