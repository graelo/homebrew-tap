class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.5.4.tar.gz"
  sha256 "860d4a623439d1b35a2799613615f65ab9709a1c92311bb0c5d76683c54577a5"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.5.3"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "c738d04dc3b7f73a8abefe20f1019ffdf88683b66de1760e356af79001e27f3a"
    sha256 cellar: :any_skip_relocation, monterey:      "224b8c0a7a31a0122de3d347ff9dc24cdbf4951c76a35c3fab046658dfb49e96"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b0718cdcb06c61c513086e9a3325e3b303f5ab7dade6571a56f9af6719d23f24"
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
