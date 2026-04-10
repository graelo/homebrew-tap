class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.10.2.tar.gz"
  sha256 "5f6397ee3ed41eb6c19df7ccd5e4419c6c3d78e55df21884def4ae4ef4566ef9"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.10.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0d3943c0cc54fa65e3b0a7996fc305bd81f1f5cba358f5ea93ec4c1af5ce3d4e"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "cc20c1fd6626f44b7319e8259e4a7e195f11aba23dcc64b4e88e5d6436f123bc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "461142d354598e5bfd0889efd17a56c345c39aac519d2015a138dd4b56e215c9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
