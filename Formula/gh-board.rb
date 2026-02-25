class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "5ae07f975157c53b70ec8976a5a41e8fadd4d0babbc1fbb7ad30df77fdf47dc1"
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
