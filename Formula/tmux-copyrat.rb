class TmuxCopyrat < Formula
  desc "Highlight and copy pattern-matched text from tmux panes"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "101289b358889b9ffc64efc96d72d61afeeab326f27f2a683b4a15235db5ec31"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.9.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "825182a020fcf09f36b6d9a096db9a6d54050e04b5440713a99a50a90d9baaff"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "e12328ee4a4155c85ee428d622adbe6d1d22a8b083e903ddc16b7839d7c3af33"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "545f42cd9c970089156eeff3aea54da8f179e2af47e22742c2bbbafc856d595c"
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
