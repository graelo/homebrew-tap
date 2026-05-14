class GitPerms < Formula
  desc "Store and restore Unix file permissions across git operations"
  homepage "https://github.com/graelo/git-perms"
  url "https://github.com/graelo/git-perms/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "c7794eac6f66737fcc13f0f18d14bbbaa4696b12fd988a7f890b9e649b561102"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/git-perms-0.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f4286f32fadac460843dd36d5280a5a82e3919f264ea3fdc1d6ce32913a67143"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "490820703411e2e5ccdfaaf4c9eaa1c4cb32ce6698df7e3e77584e57f2f239be"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f890f234f043b94725b1fa399357c33eeb7832d97c8dfafc4f9cba51ec800089"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
