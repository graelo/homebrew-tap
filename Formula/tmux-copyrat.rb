class TmuxCopyrat < Formula
  desc "Highlight and copy pattern-matched text from tmux panes"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "9283f99bcac5d893bfa3a3eeddc575ffa78d64df978b239ee14055607c6234e8"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.9.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f758bdf0fa25fefe13a36abf26a2b5b29785caa69d8da93382fb147aa31aca14"
    sha256 cellar: :any,                 arm64_linux:  "bdcf8f379067db7d380e8dc1306734b6845af00c475ed43950eca440f72b28ce"
    sha256 cellar: :any,                 x86_64_linux: "03ad8bac723caf2b772522ebf787b478d456b673a820e5f73661914e93a17a4c"
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
