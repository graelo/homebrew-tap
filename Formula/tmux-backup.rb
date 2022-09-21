class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "561c74b1745b9c59a762fbd0be922ae552a847064d5da17e7f3e3da9958a8235"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "58398e0a6555095e8be2beeeed04ae89be410a20ea323a31d282f04e012017cb"
    sha256 cellar: :any_skip_relocation, monterey:      "6dc2bd2a95541a7541c9976cb8d9fd840914ae8a434a024ac476f641e81e5fa6"
    sha256 cellar: :any_skip_relocation, big_sur:       "f506deb2dac349873560ca5eba38417a99397e486a321064e11b439a6688ef39"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "#compdef tmux-backup", shell_output("#{bin}/tmux-backup -k 10 generate-completion zsh")
  end
end
