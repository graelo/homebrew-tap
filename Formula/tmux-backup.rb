class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "de57c9b16536ea58129123818e14dbb8394008c2b3abbf435209ad1ad016a666"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "ba78d859947f13cf25d31dce9309df3c9c78b48d372b36b90eb705ad0bd836ea"
    sha256 cellar: :any_skip_relocation, monterey:      "fd8b8a742154fea5b9a55d773065e90dd9c5f088e62c9595b78d7c7deecf94f7"
    sha256 cellar: :any_skip_relocation, big_sur:       "aa8b83063f05775e155635f2cae16f4ec1032c6d2c2ed1d8a88f218c4151b1be"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"tmux-backup", "generate-completion")
  end

  test do
    assert_match "#compdef tmux-backup", shell_output("#{bin}/tmux-backup -k 10 generate-completion zsh")
  end
end
