class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.8.4.tar.gz"
  sha256 "97be8883d174712d77b8eff8edbbb4017794906ee22fa3a6174a2dfc01083511"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.8.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "34e1dcd7d7acc65d2b3f3740863a7a9e628539da1afca5362192ce7d6e75c2e2"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "fb1b58d04c9d799fed736f252ebe62a5992a469a9ef4efe4e937a191a229212a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "12fe1f359231ca9532f3831c3a81375948ef828d3bffc971cb85098bdee5a91f"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
