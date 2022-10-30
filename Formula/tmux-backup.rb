class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "5fbccaa4968da363a7d9f7a99980e7fdd242eafbe8a7f679894953173fc1adf5"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.3.1"
    sha256 cellar: :any_skip_relocation, monterey:     "697437bb5e4a322e7a093dea2e26d83e12bddc71948851be9122f9ea1f9573e9"
    sha256 cellar: :any_skip_relocation, big_sur:      "6ac8a1a3829b4d38ff70f34294af610743354ccbca684ca3c71a4c541e9c2a79"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "40ec74cb86206f5127e71dae29c6051c4e6fa54b8519a0bdfbbd7f3fa205ed00"
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
