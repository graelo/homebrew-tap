class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.18.0.tar.gz"
  sha256 "75da58dfc62992e3f907a60c7342171f90f08f58c8066394b297196ad7aeca2e"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.18.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "431c56735c3d3dae5435677dd3b7bbbfe04ee58ac87ae87af21ee0ba4fa9c5c5"
    sha256 cellar: :any,                 arm64_linux:  "c9f42c1018ec1f5bbb3ed3728b5e116063e793c2597a38a7c59ba44cd18cff67"
    sha256 cellar: :any,                 x86_64_linux: "51cdcc5a0bd441360d02d397ae4fb04fe075ab7d5ed4cbb7a2dfc169c57bbce7"
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
