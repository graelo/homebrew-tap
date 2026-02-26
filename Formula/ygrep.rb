class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.2.0.tar.gz"
  sha256 "1bd7ad6308c1769f233edd412731de31aeec5fde3f1774c022f7ae6687ad16dc"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.1.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5b2c0d15cab154cb2489bdae88919ac22879e695efe9852f8706a3509755c60f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "aeab23872fd94afd0dc83867acd570ae46f7d94f0f42e8a206f9e36b0daf8900"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
