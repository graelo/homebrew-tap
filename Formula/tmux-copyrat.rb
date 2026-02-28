class TmuxCopyrat < Formula
  desc "Tmux-copycat on Rust steroids"
  homepage "https://github.com/graelo/tmux-copyrat"
  url "https://github.com/graelo/tmux-copyrat/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "260d1d90b752f1f6fdeedadae4f0cacb11bd91d4d9ecfe10c5cbefc6af772911"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tmux-copyrat-0.8.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a2383b33116ed8c27b60935ec61937ccca0f1c25f405e8c24e0a67d7e104bf9d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0e23b3dc5e98d7a5215f26f29faaa4958e12ea5dd71538a8f35fbce86a8b5a6c"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
