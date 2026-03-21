class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "80130ae5af23b3ab2a741355baeb9a460377441a359c598e2806db49d811cd7e"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.8.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "537f3b6a9097cea1c6aef7125eee1a34b3b3f1f85ddc8ca2f3eb10ef0cbc5c48"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "ece290bf89e59aca5afe95c32b6b6e06a2e4d7af22bde87010173ff511c44572"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1ca31588f6897df71f0f29261ff39ddd7ef6a8b64ad6e8a2273bf27b7a46ab5c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
