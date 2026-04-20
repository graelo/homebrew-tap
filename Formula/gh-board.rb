class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.11.1.tar.gz"
  sha256 "804b7007c6e6f96c284e1574763e223507cd7912831977b4873014cff5a72528"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.11.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "84a0d4242761472bcba40a5dd96cbe329ef94c48e87d14f5d906bb0010ae9c82"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "db6dbc492854887e77bd14729e458f0d1314f343c09ecfd6c244b0f22494ba0f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7b55de8eebd2b833f68a39de9387ac1baaaf972b0521359287ce66ef4137c832"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
