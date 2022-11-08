class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "2e49bf8cf0c9642c4ed0c19ff936773c6eae5256557c719301da5b7fcd6e4996"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.4.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "e6177f75c0e5bd44e7ccfb300683a3cafe60f5c9c234b2cc9926f34374ae7190"
    sha256 cellar: :any_skip_relocation, monterey:      "da71ee8f467032408d51e432b194b05dce9810165da47b10c4e28f760ff0ba90"
    sha256 cellar: :any_skip_relocation, big_sur:       "af8882090248dcd65e3fb224f6e58b6b4078183da426eb49c162a04a0a2a392d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "600c0725da8a508db5f0f98e07515e567e62262bc1bbf3bfefe25f20fdf91e05"
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
