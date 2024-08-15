class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.5.6.tar.gz"
  sha256 "28fe42ef0599402050470218e7a60dc9e9c925f4aa7f2ba62e79b35cb49e423d"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.5.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b77847e195b1a2d04c83cd68982db0fe985a3314d47a46ceda8c67f28848fd8b"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
