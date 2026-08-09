class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "1b43da6bd1bac701b52cd6ce13e9b4bf0407b6035d2577020d0c716f061bf30d"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.6.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7a0a489080534a396d68d1281f6d5c4d68846b7ae31486cde83a96af3aa3de5e"
    sha256 cellar: :any,                 arm64_linux:  "4a11ef084f8851b609ded221311f3f890a601fba26b04d518e0b689b20fc82fc"
    sha256 cellar: :any,                 x86_64_linux: "9bb19aee090b0c2bfb4df869beb4caf8fbf88c922f5bdc530f447643c3859900"
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
