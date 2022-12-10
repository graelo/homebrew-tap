class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "1a78963552fa8c969bc163e79069f9a7e810b6b72126808d9d29035df0b97195"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.5.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "66c01ed9feda1af71cc16252af58f1d265a8ae36233abb4068cc9cad7e678398"
    sha256 cellar: :any_skip_relocation, monterey:      "9d1e60f8a39cc32834b2ce28c47f5e1f47700b7e5de9ca0dca7f6db0d34211cd"
    sha256 cellar: :any_skip_relocation, big_sur:       "a48c001d1a06c7c6d6833b969ec172dee4525791ca46ad62a4c7e44c13234fd3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bb852980d13b21b839bd65f8058795e94e4f36b03b760e950049244063a79c1b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
