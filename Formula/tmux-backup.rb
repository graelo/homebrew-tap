class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.10.tar.gz"
  sha256 "fe75fa0935e84f7e5c6eef3f708a0ea60cc3193d6ecbe35b6bec96c3927b7c8c"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.10"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a99fd580502af14b52a3e0234aa43ef0daca3767232a40d35f4bd15c21e721c3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "799c08be9390214f1c678d7c288747ff0aee210711663cdee8b2cdf78ec1ae4c"
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
