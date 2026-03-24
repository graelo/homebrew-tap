class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.10.1.tar.gz"
  sha256 "e6134965113f9e6121b06eeec5c261934bfd203f63e00317b38966769a7303f4"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.10.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f6e46575f24e5ea8f3aa5eb5c596da477f0cb9a5f4471d23428f6e8ed4115ecb"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "ba30cae0b659f5b58ea063b4efcc6c093b7a002d44b2abed29f0e51abb3bcfbf"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f8a59376520320b57c4565cf2462ac5df4a1e626b2f76e9ac0f56f734b2755af"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
