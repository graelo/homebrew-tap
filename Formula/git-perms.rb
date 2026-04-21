class GitPerms < Formula
  desc "Store and restore Unix file permissions across git operations"
  homepage "https://github.com/graelo/git-perms"
  url "https://github.com/graelo/git-perms/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "27e25702114d480394ab1c197b513c6919d275d20559d9cbe88096d2538952f8"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/git-perms-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "861a7505dc4395100c05e20c7e505cdb93ccd11c44f1cd3591ddcb7c16cb4e81"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "d9a29cd5219bf7aa9241e09ab61843a3adb545d2dfeb041ff31a367fe20b60ef"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b46a3924da0c7554bb9d1fa87f327bdfbfbe03d20de0471e4335bd730a4d2551"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
