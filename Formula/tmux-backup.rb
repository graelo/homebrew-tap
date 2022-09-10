class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a3d7cb93e46194922aa910fccb4040ccf60bf7131474b8d7770d01c5be8b2a7a"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.1.0"
    sha256 cellar: :any_skip_relocation, monterey: "c6acfeaf12d9bf0c16da46e0f5612ee3a3cdc065c6eec42e7422f0293d23d923"
    sha256 cellar: :any_skip_relocation, big_sur:  "7e865749883ae06063ca97b8ad4153b264c113d9e835ade407d1fbd909bb7f54"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "#compdef tmux-backup", shell_output("#{bin}/tmux-backup -k 10 generate-completion zsh")
  end
end
