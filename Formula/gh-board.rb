class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "4b6d75321b839e318ec061cb82491384a6028a3016aed88b15344d94d8f6a409"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "da068824e7eae2aebbea7dc951f4e24b8a6eb8bc3a9ce33c6ad2cdb70283c08f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e23da9da21c1b6c64c6e8f09fd9d25f9725afbe62856781a9149ce5510146a3b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
