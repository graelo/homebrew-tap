class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.17.1.tar.gz"
  sha256 "bdb618c152fc12cf920fbec7be9548bc9d7011274a81b28df517e269efa03ecf"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.17.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c3c5da19c1b25e9d2d61753b5cb639e9bcf5c81fdbefe5439a8bfa72b667f542"
    sha256 cellar: :any,                 arm64_linux:  "e7c34d17333ed2018150d133e3f419a04fb43e22b2c812b61b37d5a74ab5a820"
    sha256 cellar: :any,                 x86_64_linux: "70b0408cca707f87ca2bc23c949c3dd519fbf62fad1e2d7dd6a6217f7a437397"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
