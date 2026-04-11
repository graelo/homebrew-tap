class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.13.tar.gz"
  sha256 "f3341645bb8fd755ef704d4bd45330a146456eefbcfcb411133e1467eb9afde3"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.12"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "44d970ee5798424d1ab8bc2bdb0769cd083a9e9b081d0ddb9f37089c03c81d83"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "2a32800ba8183935509c45f8b5745f80fffa9b4fa61cb7fd153159c25c185594"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3264bf11603a767aa0189c6993fce14f06336e7a3fbae88d6316f765b07f9b2e"
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
