class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.7.tar.gz"
  sha256 "60918deeb68a9f0b614581acc788b9aca720696f1cefebe2922b253e4c11f46f"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "98d03eb5e9e50e42bdec06f041af46b9042633a1679c765c1235a932367bf588"
    sha256 cellar: :any_skip_relocation, ventura:      "5cf1b00d1bc937cdecbe12bcee2a9bce4e37b1bd45c477a0f2d678eec85e92a7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fcabdcdacc405c0c37696caa94197ad25cb00c2625d3d62d3d11af66c777ddf2"
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
