class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.6.tar.gz"
  sha256 "17db80e0249031459901d500d9bcb0070f9dd4d4b306008ce3d47e952b380bfe"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b0a76f9ac1f71a2505fd5e0c40bb01a8b9c5eed8ec328ae70b7ba4d6b5235dd5"
    sha256 cellar: :any_skip_relocation, ventura:      "b7ea396cea767e8a98398d50b053c09f14aec2248a5eb4a5bbbf0e33a8585055"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dd589edf2d7799c1f1276f181dd215669f45e25e9b52667101d02482e7865bc2"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"tmux-backup", "generate-completion")
  end

  test do
    assert_match "#compdef tmux-backup", shell_output("#{bin}/tmux-backup generate-completion zsh")
  end
end
