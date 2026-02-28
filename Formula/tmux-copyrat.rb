class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "260d1d90b752f1f6fdeedadae4f0cacb11bd91d4d9ecfe10c5cbefc6af772911"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.8.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d202de793c9959fa3f7a8261c01c54f1e3ab4e5558bfef93f2f90f4c380cae05"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2db1077fff16a3bdf6247bed21953d4f5928a940f8187973e44200c1d46d4369"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
