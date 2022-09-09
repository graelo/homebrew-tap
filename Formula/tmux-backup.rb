class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a3d7cb93e46194922aa910fccb4040ccf60bf7131474b8d7770d01c5be8b2a7a"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.0.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "ecebf1a93984497d5b69ef6601ad2fa382be90605c92c1cd9cb657205c0fbd60"
    sha256 cellar: :any_skip_relocation, monterey:      "ccd6b127a725ae56711613cd0b446acd422b1c800b855cadb0c87666fe785b8d"
    sha256 cellar: :any_skip_relocation, big_sur:       "3d4068803d6662234d02959fad361e43c6c266ff3de83f0b6fea38d8c0694c46"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "97fa1f9d755db1c858f83cedd2c547eceb9fe15890fa07624c87d7f2ba0be144"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "#compdef tmux-backup", shell_output("#{bin}/tmux-backup -k 10 generate-completion zsh")
  end
end
