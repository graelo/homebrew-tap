class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.1.4.tar.gz"
  sha256 "b9ff9b3c91422947f60ae4566605df1c8a353182b33841db44450605112da898"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8520a99adcc1cd2f1e533659112c779470735841ace8f07a9a62499ac589c2df"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "cd9de56112dbe8652f0999bc36229d99b5b33b73d294dc2e50c538fd9dce8635"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
