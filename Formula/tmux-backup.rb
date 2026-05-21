class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.20.tar.gz"
  sha256 "7d2c6906bb396b92cb3c0025b459c7268eab7f0330f88e6c65e5870220d39608"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.20"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "865bcdd1866c60d091ebac9b7d71e79f9bbf82005369cb51bfaa8df905b3a82e"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "5dbefc201849830f0af05fb27535e485d3cba00398f7d4cdcb782707b9de23ea"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f432ea5dd88cdbbcf0d029a048ec9516b4b36c06f7b28c7637319e70bf0c14c6"
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
