class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.18.4.tar.gz"
  sha256 "c309b5a55cf29a04def5beb412b1d7af784c2cc32a3c5daa28d63f32deb5b4fa"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.18.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d0159f8d37a736889f04e59cea78899d4f1b89956bf4cd78019afe7528a691ae"
    sha256 cellar: :any,                 arm64_linux:  "d2437b017cdd458d90fb02507a57584a826a73eab72cb89f6b214e1b0f7b6d2f"
    sha256 cellar: :any,                 x86_64_linux: "37085a0d4e1d34e497e70c924d432ae928d9234e145da7bbf513562b65a4b0b9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "man/gh-board.1"
  end

  test do
    system "true"
  end
end
