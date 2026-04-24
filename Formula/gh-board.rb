class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.16.0.tar.gz"
  sha256 "7bd3418c4ce57bcb2434191d80eefb657fc5bd349e61765b5738903e04933b3f"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.16.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5fc9d1e095675078ea4cc5ef2de44b8e8f47c72eb5942e1875c6b9eb7cfaf8e0"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "aaed2a868348aaef93e8265c88de36bb5825b2dd23913d664462813a77e28bfd"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "be5798d056f2155ec0e92c1b64352af9585ed01ba7de2d1d17213330e3d4816b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
