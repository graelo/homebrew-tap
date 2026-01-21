class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "f8d658f1805ab1a9eb22f4b30242c9f4fbe7ec2a799e9ef042f507f67f7d9501"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.7.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fcbc079a8ddaa7208176e745daf1c60f6228e9fbb4495177fc6e087385c6e53b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b818c3aca8b957884c2798a846fb903e4890ce3ae23ffb13c63338be36c9efc7"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
