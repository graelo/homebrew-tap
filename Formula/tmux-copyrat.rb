class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.5.7.tar.gz"
  sha256 "b91d96b3df9986efb5390143323fe129217b46a0fa3ad6ecc23ac26620b0e202"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.5.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "62b470fb87f15b819aa8bdf5ba1630ece3710ff9d20cf079a51e87c9b8b3dffa"
    sha256 cellar: :any_skip_relocation, ventura:      "0c63334d515ef68770cb4009690aa91b74ea814b637a7283714f6dbb6eff19b4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6ea582b6863f55a8771c72c0debdfac825d88615d17f05c48362cd6328ce329c"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
