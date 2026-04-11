class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.13.tar.gz"
  sha256 "f3341645bb8fd755ef704d4bd45330a146456eefbcfcb411133e1467eb9afde3"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.13"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "439dbed1399f654a4a64c5c068eb5080350b17a0898a11ef981c53d5cb9a6454"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "863a21b6037de0ab63cc8596e7dc82736f4cff4757c56479c2084d91ab65bde7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "815995513537d6962b23bdb3d62f1314e2f50d7b9e2deb379770fa0667dcd61c"
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
