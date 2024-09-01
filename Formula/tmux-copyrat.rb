class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.5.7.tar.gz"
  sha256 "b91d96b3df9986efb5390143323fe129217b46a0fa3ad6ecc23ac26620b0e202"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.5.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6a76e3c63b7fb141120725ee70e14003925868f669731302ab1a6cbf434e3d0d"
    sha256 cellar: :any_skip_relocation, ventura:      "14886dd71b7b06948c63f0443ee1ac729008348e82cc4b8b8c94e11bf8d89c3f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b1b961ef0f360a59a7e17b2ce31aa6c04a6c290be884ce0dbfbb6c627cbbb053"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
