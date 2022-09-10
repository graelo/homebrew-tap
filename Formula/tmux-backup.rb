class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6fa56a0c0876b76607858a1f10c707b2a196d97b3eebeaf2a8e7f4c7d765a05e"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "ad177a80e25a5fde8d524bac10dabd988aaa0c58260d43dd45b0bb86b0a554f6"
    sha256 cellar: :any_skip_relocation, monterey:      "c6acfeaf12d9bf0c16da46e0f5612ee3a3cdc065c6eec42e7422f0293d23d923"
    sha256 cellar: :any_skip_relocation, big_sur:       "7e865749883ae06063ca97b8ad4153b264c113d9e835ade407d1fbd909bb7f54"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "#compdef tmux-backup", shell_output("#{bin}/tmux-backup -k 10 generate-completion zsh")
  end
end
