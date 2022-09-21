class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "561c74b1745b9c59a762fbd0be922ae552a847064d5da17e7f3e3da9958a8235"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.2.0"
    sha256 cellar: :any_skip_relocation, monterey: "fd8b8a742154fea5b9a55d773065e90dd9c5f088e62c9595b78d7c7deecf94f7"
    sha256 cellar: :any_skip_relocation, big_sur:  "aa8b83063f05775e155635f2cae16f4ec1032c6d2c2ed1d8a88f218c4151b1be"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "#compdef tmux-backup", shell_output("#{bin}/tmux-backup -k 10 generate-completion zsh")
  end
end
