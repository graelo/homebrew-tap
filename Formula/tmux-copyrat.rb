class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "b8adb06e3178fd1bcacc1653ed2acf38af87d4b6308a3c3d94ec8804ea1234e5"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.6.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ee03987ae9039318cb52802c97b3959ff7d9ea15856d501d4b81fa5c2ce90a27"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4ce09d98f5a7b968fc2545e34ea46d84848e248a3773c221954b6634cfe35e01"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
