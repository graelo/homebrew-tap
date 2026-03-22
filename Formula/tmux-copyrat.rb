class TmuxCopyrat < Formula
  desc "Highlight and copy pattern-matched text from tmux panes"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.8.5.tar.gz"
  sha256 "c4cb11e4d9d355d025eecbc86c6f189f72d2a11c3508b096f9458f48ec7020a4"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.8.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "95862e21d9a3f8a0f9566ef40afc5b079952ce54597701eae7a60a6879abfcd5"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "b3f3550a6388930a256554843a9c9f2ee8b8db695d1aa4f134549a51dca508d4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "aa644e3898d267e018668879a0966c14f6af6d385f75ea5fa8dc33254b3fb86d"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "man/tmux-copyrat.1", "man/copyrat.1"
  end

  test do
    system "true"
  end
end
