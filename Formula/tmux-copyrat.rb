class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "7ac1bcf1eabd00d9b6db5123563008dba6790e52734f164420c00e26b72017ab"
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
