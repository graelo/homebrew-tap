class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "2acf44cab9194c2976c0237c151f465fd3fec53d25c02e0ce8891dd737e2d798"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1e5156f55789210d2ccb3da8e4551f460363d4bccbfaa330d78697af7ad63dff"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ac887850a7db10ca19caf219c6fb042bf47e071f724b1d67a93eb9322e73805e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
