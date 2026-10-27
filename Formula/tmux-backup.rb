class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "378e5d083b24a5a53fa1457122e02bfee312a809284e811fe1f23c0ff1aa870c"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.8.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "822040ca597223c95e0fb67d7fcefb5a6d3b0500d223372d44e34fb9b01955d5"
    sha256 cellar: :any,                 arm64_linux:  "25c4a70c3a8e52922cfb69ecfe605c76788111f402d6d0d3d36e43a13d6b2546"
    sha256 cellar: :any,                 x86_64_linux: "9ac754c4ef9cb470079f1cb7730224a4ee39e2bb5518559552ed863c1d710140"
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
