class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "5259509f03b216d07a36c2c46d4d361ba909c6634940d4e1f57cd44b9c2ce5bd"
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
