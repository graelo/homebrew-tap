class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "4296854fe0195421f53c3ae6d05b2f19cbc3ce6b3113faed8651fe1f80b1faf9"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.9.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "040b03bd9a6f68d74f9873d1062a42dfdeb4578280fbd873b4e421f2af3b7b08"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "baf8dc35f768044a8b1d23bdfa38a1458855f28b29b827ec3315e918760bc585"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "941e7b86c45daf3e3be9b571d9ff60ea8cb073ecf9c850cf2cfe9d73472a8044"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
