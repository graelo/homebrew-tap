class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "f00472c1bf200eefedbc7dd4cb86d056060039ec2a9c8dba764a31a79f4399b8"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.5.3"
    sha256 cellar: :any_skip_relocation, monterey:     "171b444d4423860e1117ff559bb11c6bc84b06617879122f996851d28a79a2eb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6dff5934f934fbcfb03f30ebb3515de7b6f741d8dc12db74e20493ac93f4ec6e"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
