class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "943c8a9d88f414df5b41870ab82bd0d67237897d495a0da25d9d1224cd3ebf5d"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.5.0"
    sha256 cellar: :any_skip_relocation, monterey:     "dba26115cee3217a62325d9d673b1a32118a5a7a1ef8f239a4a0bf6180a6faad"
    sha256 cellar: :any_skip_relocation, big_sur:      "9ec2571b69d62d5be3d6f15fa979184a13eea6aafc6e2b4190fa51c4588a9a1d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "210e7bcbfeddb7ff8ee7dba3fea160b5ca4faac01e62f5986c12391a28a1c76f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
