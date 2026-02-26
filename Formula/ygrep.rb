class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.2.0.tar.gz"
  sha256 "1bd7ad6308c1769f233edd412731de31aeec5fde3f1774c022f7ae6687ad16dc"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fe9e1b10614344849b1244f1d943d9d4b875a9e30fd2c4a8186092275708f28e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f7f04887a3a5bb8d710a7d49da8d7d877d42fa9f5cad56ce2f81faa694633bf9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
