class TmuxCopyrat < Formula
  desc "Highlight and copy pattern-matched text from tmux panes"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.8.6.tar.gz"
  sha256 "bf3b710f99525a112b6fd802a35cddd0ebb0883a732f811999c2b7f26df16aa8"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.8.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "95598f7d796d900dee66570c47bf22856301c23e66a4cb004dc4b3a4599a899e"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "c237bb51573d36c39041769ff9b96d3cda092138c04add319a2a6bdbf8f517ff"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e5f8572ceb0fcfbf7298fc42296166972b44ff54616a0702d97b693c6016e202"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "man/tmux-copyrat.1", "man/copyrat.1"
  end

  test do
    system "true"
  end
end
