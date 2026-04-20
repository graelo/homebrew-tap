class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "036ae04b12a88382e22ab9a6b69acdbb047610d4dbc9b2f716efdfe65fafcb47"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.11.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "91ba1cc3529926a1032b4afafd34188120487cf9d106f14e24c1f9a241e77b28"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "85b7dce01c44c3da5d43e57b470e4f5b0c67f4e9c314def026d8d8b037fe5978"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ac53e9c42fae30b4b85305f07af63adaeed6c4801046bb7ed6f02835f61254db"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
