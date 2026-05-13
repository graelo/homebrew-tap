class TmuxCopyrat < Formula
  desc "Highlight and copy pattern-matched text from tmux panes"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "101289b358889b9ffc64efc96d72d61afeeab326f27f2a683b4a15235db5ec31"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.8.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a76ac634d06982ded7143b18983459f1797a1bc8f3f84731acea7cc868e3189d"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "d4dda26dfecda6b2bf6de1ccef5f97c70585170fa58e3d21dbc0b04a143ec71b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8a8a4456a7d45f542d13564789447d444b964eeeff19df84debacfb70bc15385"
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
