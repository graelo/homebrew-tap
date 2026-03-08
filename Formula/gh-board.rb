class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "ac72bb67de6b92cda20f24c5b7dd1cc7aeb639c30dee6c97a370711cf42615b7"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.8.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "80d5ab01de61123ec967f0cdea7b34905ffa4e75497106312ca66124e10b0f69"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2ddf820914fab499d8a5d4f2cb631f7a690c5045412e801f3fcd41265600b888"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
