class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.4.tar.gz"
  sha256 "860d4a623439d1b35a2799613615f65ab9709a1c92311bb0c5d76683c54577a5"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.4"
    sha256 cellar: :any_skip_relocation, monterey:     "6811b2848b629f1ef2b54a9a77c1abef5e14c912f67bdf6324822fa4e3448ff6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "31d271ab553918e5c1e4c89cd32d23d6816e7f06b95591ae2b94503703e2ba99"
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
