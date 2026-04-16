class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.16.tar.gz"
  sha256 "773e2d85834cbb1314194783ebe954150021fccf84202308c621086b906cc2b4"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.16"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8b01fa1f153baba615f4c9a82fe981b3bb98c14f45d242ca5ddfb8b72b95f695"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "d13777d0390a51a98123f6d03b81ed50be6b4462890770bf0759c4fea871c878"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "903638c6a869ccf4c86ee7f53977c15fd4216cd75ddfbd500410988326ab2827"
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
