class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.20.tar.gz"
  sha256 "7d2c6906bb396b92cb3c0025b459c7268eab7f0330f88e6c65e5870220d39608"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.19"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1b73d8073619a2f4b20dc036b3aaba31e082e52814266aa8df1c09fe16bdb3d6"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "ff1e4327524c8b6773ccff99069abbe3fd358b6b0a4730fa7811056fc78bc245"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "245b523365274174b5027d222424a2b2611555337fc7f276da87962e0e6be179"
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
