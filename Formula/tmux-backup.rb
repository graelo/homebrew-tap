class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.15.tar.gz"
  sha256 "dfb45178260eecdc013bb7c3f5bf3fe0554a7c2f42734e5112550f99818b4c60"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.15"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ec13c42ea36d914a1ed3aabde889d53d7aed320c57a62f4f8a1226dd4e5b9bca"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "0c09e3a0d3662c212bcb01b1478d17f8071e0a9244043a0b0246c422914b0150"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f93abab48ecb2d7a127b887bc62e6eaa426e8d3d356989cf4dc1a40da61caa4a"
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
