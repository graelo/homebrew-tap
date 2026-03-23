class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.11.tar.gz"
  sha256 "b6016450442571c42fc7e74d126de4aff031baf407834b4ee5dbfa7c353de877"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.11"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "225c6af6871d66d53415a7760c9272aa3e6fd919b0a6e6a9be665cfd867050e8"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "257c0258a61dd9b7afe7b25a8e5dc4d5cc49074be9f892c522ded8d55f55fd89"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "203511d8b3d8cfa586411f67ee461d426b9ff0b40411bf6ee646a3d8d4d127ea"
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
