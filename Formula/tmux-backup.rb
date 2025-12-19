class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.10.tar.gz"
  sha256 "fe75fa0935e84f7e5c6eef3f708a0ea60cc3193d6ecbe35b6bec96c3927b7c8c"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "30d2775f741e4989e80d3fdec31180b00ca9b449895f541a83ba379483cd16d7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5884c22565dd6f8408763060e7e10e6a685340d39e78d8365aa97d25d39b980f"
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
