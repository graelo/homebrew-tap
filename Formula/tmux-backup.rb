class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "23641bb4ddfe1219d343451c675c5edb00dd7d35b9a7cd695331676172a9f941"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.0"
    sha256 cellar: :any_skip_relocation, monterey:     "2870fb0e67741d2d6debb896bc694e47583a85139b5a984c965ae0359a60889a"
    sha256 cellar: :any_skip_relocation, big_sur:      "515ee5a07f53797201b230eb3f189544b51a98aa106a7b4f4b74e420ab182c2e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "60b510acafea12781392c9f3d6ee44de7aa2306c469d5eeb02144188d80c2e6d"
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
