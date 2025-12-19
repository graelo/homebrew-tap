class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.9.tar.gz"
  sha256 "abf71b53c83503dba3ea6d563c7f31fc237ff95d17152c2690b6cee80ccff064"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "26e25b47f907f0064ea971b42df8ea65aec89c92ab0eeb57a0e1db6aec69b83f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ca3b6361b8c7475745502d7831dd19ad4d03e4ab73c567c9a6bed4783798712f"
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
