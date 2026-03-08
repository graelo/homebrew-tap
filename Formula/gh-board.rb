class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "ac72bb67de6b92cda20f24c5b7dd1cc7aeb639c30dee6c97a370711cf42615b7"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.7.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1963ec6b5b7825bce60c52d79503cedd65b9230522d78dddfaf59d26a295e751"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "57f6d6bb28fe910873f4db9f6ebbded16e4f614dd3f7a587bd2822e8f21047a6"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
