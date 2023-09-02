class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.5.4.tar.gz"
  sha256 "60353e05ce6cd821c3c29b9decb29e84bb1feb2d83032304bb63b836d3780e0d"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.5.4"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "fe9c502b6e9502040a99bf2dbb95665826aa82c854687066424b94a4d88757d1"
    sha256 cellar: :any_skip_relocation, monterey:      "4a1b7f8c1ee342c554301dc3e895a6ba80a9e1435c3bd12cf5fd994a38285b78"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "57ee9215a3ea34354efb12060c2d72c4d4cb8434cf4e47c6b7d4d2f0d36f6142"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
