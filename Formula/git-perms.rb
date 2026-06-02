class GitPerms < Formula
  desc "Store and restore Unix file permissions across git operations"
  homepage "https://github.com/graelo/git-perms"
  url "https://github.com/graelo/git-perms/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "b7442691b73a31c5ae572edcb4a79bcfd80600724014a80e8f0a4f25a4b19369"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/git-perms-0.0.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "37bdbefd2a74e29412d3f37c7de63c4dcbc74e7473371b03be8069abf154f1c8"
    sha256 cellar: :any,                 arm64_linux:   "c6fced3096826749fda562122912a3e962108b241e5ddd175989dfe488b73fcc"
    sha256 cellar: :any,                 x86_64_linux:  "474a5446f79e5bb711d7a6ac29b66147740a097991f5ee9f6a7c84b0f34f2f68"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
