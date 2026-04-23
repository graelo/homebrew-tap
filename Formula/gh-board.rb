class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.14.0.tar.gz"
  sha256 "08553d0c66ece2ccb649ba2dee314c991b2fa00a2257591e8ad9c8614da71803"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.14.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "64702546ad2baab9c07358166c3f431186f519fa152f22ae5812024790f48e99"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "70523901a39d8a48915a8207dd24c42eedf984a1a9824b20de487260da69e22a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c8eb578a19cba44be2465f037970accaeb8eb37f7d071f23b01526ea19fd1138"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
