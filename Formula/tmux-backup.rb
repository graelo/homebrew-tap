class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.7.tar.gz"
  sha256 "60918deeb68a9f0b614581acc788b9aca720696f1cefebe2922b253e4c11f46f"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e8dfafc638f8ee0754931da9d0c6d1bf2ff43af3d075df1137786196b5f1d83c"
    sha256 cellar: :any_skip_relocation, ventura:      "88a21c9d832d927d818e3e9f21dae087c7556de02ba0a915bb0bd7b302698908"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9ab54f5bee4087ff9365aef70b5ebc21e6d06298285598b52325e54b7de04db3"
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
