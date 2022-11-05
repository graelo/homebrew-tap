class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "ac974ce22419e6f03e9c6bbc0ac1658968610dde2ccc7c328c810387a122156e"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.3.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "2ed44d27fe17482518aaeb805351ff56d07e795403dbf0cb52059034a2c84ee1"
    sha256 cellar: :any_skip_relocation, monterey:      "697437bb5e4a322e7a093dea2e26d83e12bddc71948851be9122f9ea1f9573e9"
    sha256 cellar: :any_skip_relocation, big_sur:       "6ac8a1a3829b4d38ff70f34294af610743354ccbca684ca3c71a4c541e9c2a79"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "40ec74cb86206f5127e71dae29c6051c4e6fa54b8519a0bdfbbd7f3fa205ed00"
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
