class TmuxBackup < Formula
  desc "Backup & restore Tmux sessions"
  homepage "https://github.com/graelo/tmux-backup"
  url "https://github.com/graelo/tmux-backup/archive/refs/tags/0.0.0.tar.gz"
  sha256 "fb932b5f31dd58961908079b67e5b4bd64631a89f5e6757069cb2a09d4d24543"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-backup-0.0.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "dc178b96cb0dc2644a2ce8234b6a65982f26103a7ff8eaa17ed19b9f452651e8"
    sha256 cellar: :any_skip_relocation, monterey:      "133e614ad499e22660eaad6081ac847856aba1d937ae7cfb0ad34bb6bb40d0b4"
    sha256 cellar: :any_skip_relocation, big_sur:       "1f912cfcf78c35a5b584c72582342494e720a2b2db4e6e6755cf40ad263a211e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2d142ccafd7eb221a0a63ecbdcc984e05856eaece750c866c905e1a4c9e56030"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "#compdef tmux-backup", shell_output("#{bin}/tmux-backup -k 10 generate-completion zsh")
  end
end
