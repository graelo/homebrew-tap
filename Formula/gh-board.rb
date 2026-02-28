class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "c0db7684d497e651f4e6f4afd0bada7ad8f3757b173237a8ec0c2a47e2e627b3"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.6.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "10c20c85bdf7ae26b62ecc4b9b9791ed569e9572ec06059f6844cda2564dba00"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2d1d2a41b55af40d9530803112dd1a3aee98dec6f577ea2c1d68b71fb8d7978a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
