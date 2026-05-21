class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.18.tar.gz"
  sha256 "3b0edd79eba503e7135f684274ea7a78eff724aec93fd69536d5d354cf0f0d92"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.17"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f84a85e6232612f531bbad7725fe50f262a29a4680f948ff22739f8e6e3b134d"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "eea379a8c59dc1bf7a5be18a867aa16f7e558396af39a39d16d03ba5c1d788df"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "102fab18c1574efb2340c96359cebdfeaa56e45857b0e5c7d66061d019f8d421"
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
