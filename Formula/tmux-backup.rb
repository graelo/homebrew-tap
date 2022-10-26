class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "5d138ee934dd9f29e39480b185e51bfe66a3b6a9cecaf66272ad7af0813a7306"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.3.0"
    sha256 cellar: :any_skip_relocation, monterey:     "665bbc19579f798425c04f19a2d6fa5ba5cd55d1b17c28e16dc801971661a6bc"
    sha256 cellar: :any_skip_relocation, big_sur:      "796e644d5e6362d09a3d9c59d6e05ea44ad7ea14220e41ee100477913585ab17"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3a1d0064eea9b58c5f786f1eb1719d6b0fc2ba27778759a691f9739d3c97ffa3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"tmux-backup", "generate-completion")
  end

  test do
    assert_match "#compdef tmux-backup", shell_output("#{bin}/tmux-backup generate-completion zsh")
  end
end
