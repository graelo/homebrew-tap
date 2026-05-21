class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.19.tar.gz"
  sha256 "10a9b6b4db0ef75ddcb67eeb6b25fdb2a28afe3d18e49289a636642d65e4ea3a"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.18"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "24147e8f7d12240272a7598b5ecf5dc97b28c64d6bfca25caa469e881bfdd37c"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "ba2b91c97fbcdd52024965160f0d715d0d6cf06d4aa9978702b715cd478351b2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1b615a3792b33c106abdb0fb0cd71777c69c1a99f7a9d74877fc9ff17465292c"
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
