class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "ac974ce22419e6f03e9c6bbc0ac1658968610dde2ccc7c328c810387a122156e"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.4.0"
    sha256 cellar: :any_skip_relocation, monterey:     "a70b9731a64e7dc7c5acb694e8bf71116fb90d296c4f5918c049e43424528c6f"
    sha256 cellar: :any_skip_relocation, big_sur:      "bb7603d19381cd0ec9673a163459fb9beea0b2e33cb2becc80e45a2df36b0b11"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d9bbf5b2cd4c3a329888f1086807c09cc54b9d8f404e27094d27ae3f1b5f0372"
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
