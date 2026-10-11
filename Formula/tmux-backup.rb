class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "ba2ad0186582489a602ea2bf27fd3a64a7a0349b785e1ab9b0b033ec9b64bf93"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.7.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "04b2e812f06fc74d0708f1e5400b18f78d26b94a74ee9d49892302c0753bbe18"
    sha256 cellar: :any,                 arm64_linux:  "fb127459f0450da07db8e2cdb6358f613bb8eae7fa821bfcefd1785e6f8d490e"
    sha256 cellar: :any,                 x86_64_linux: "d28e2298b1643ee356f3ec8ab9f57c927c8b8dd445b5a4c3e2fbd01f65f0813d"
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
