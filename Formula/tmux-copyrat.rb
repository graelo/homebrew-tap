class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "b8adb06e3178fd1bcacc1653ed2acf38af87d4b6308a3c3d94ec8804ea1234e5"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.6.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8746212c9e4e2b06402e582a22819a430b5bcb2468db1bcd59f08f82fbad5d55"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e172812abc9098002a54252687cbf5384c7918dff8df0b1fc27afaaac630dcf3"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
