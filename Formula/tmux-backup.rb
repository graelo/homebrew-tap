class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "35deec28cc6fb613f2b4c193ecf89ff048e9c1e7ec57ea92327177c509306fe9"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.2"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "b1b3e65ad2a3d0b6f7b714aa6e088c12a17e9007793a0eaa901584b981ec3f48"
    sha256 cellar: :any_skip_relocation, monterey:      "bb990b7d7926ba88602bbed1b76900689af10b49057c3f7db272f35b0cc57fc7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "073d7919257e1a549439b558d6f774668596f9a605088864880fa33ef03881d6"
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
