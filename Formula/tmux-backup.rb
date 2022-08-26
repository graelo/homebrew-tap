class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "4f43aa230622a81889131f270ea26ca48bb4f934c354299280d5c18c9f9c1b42"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.0.1"
    sha256 cellar: :any_skip_relocation, monterey:     "ccd6b127a725ae56711613cd0b446acd422b1c800b855cadb0c87666fe785b8d"
    sha256 cellar: :any_skip_relocation, big_sur:      "3d4068803d6662234d02959fad361e43c6c266ff3de83f0b6fea38d8c0694c46"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "97fa1f9d755db1c858f83cedd2c547eceb9fe15890fa07624c87d7f2ba0be144"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "#compdef tmux-backup", shell_output("#{bin}/tmux-backup -k 10 generate-completion zsh")
  end
end
