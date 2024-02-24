class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.5.5.tar.gz"
  sha256 "850bfbcb35eb32c911a2573ce71c06412817d47cc50d1a09cbe9c9557ec8f6ac"
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
