class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "73c579ee0b9565c5ed0c0bc7f4097f8919ecb63d799e814f65d16aae2f68aa5a"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.5.2"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "9f7162d27d289b3206c78bf819ba4715c1cd862e59c5bb42e4d6851fc46e5fc0"
    sha256 cellar: :any_skip_relocation, monterey:      "e5f38e952ab2fe3fb01d4fbe87c101a13738ef13243bc43543af11f6b8794887"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "91b5a2065ac40f3874508dca5a06577963258473d88431634f89f3f6f5426abf"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
