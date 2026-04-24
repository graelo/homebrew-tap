class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.15.0.tar.gz"
  sha256 "d871a4d27649ec3bf5424a9a5274ba53493605d5338f49291f2cb95db2078577"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.15.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fad2d02acfb65171e2a0de23a1190dbf0e94d768ff3ccbcd96752162014c9e23"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "66cbdb49e1cf0db8a79964fbc2104070b906aeeacca2586bd92830b417d74e67"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0e645283191761bc5b6f152fd588866542eeb9ebbaff08237e98ab61c0069144"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
