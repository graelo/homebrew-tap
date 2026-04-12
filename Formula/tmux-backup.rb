class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.15.tar.gz"
  sha256 "dfb45178260eecdc013bb7c3f5bf3fe0554a7c2f42734e5112550f99818b4c60"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.14"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6e214d420073aab852908677fbc8fb3c5212157ac3f09ae33a83b7d75a442dba"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "5a2040c3627ea38e2226b1871479c500aa186a2350c86d3fc41ed0ec229af972"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "633911dca5d1e702032e1321feb6fa4da0b72c93ae90814d456cc07d37b65beb"
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
