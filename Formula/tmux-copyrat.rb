class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "7ac1bcf1eabd00d9b6db5123563008dba6790e52734f164420c00e26b72017ab"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.8.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f27e00944a01bd4b4fb754f9adf405918a280c4ee29e8a23dcc6c31a0a51d999"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a3b59ae481e1f0cac3ca871c92dc635607d7634e97fdee4736e6dacd999c3042"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
