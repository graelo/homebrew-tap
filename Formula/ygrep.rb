class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.1.4.tar.gz"
  sha256 "b9ff9b3c91422947f60ae4566605df1c8a353182b33841db44450605112da898"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.1.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dc7be1aa063ad834f4f6a56fe23af97575ce825bec61cad951b7b9a26c06662c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "813353074ce6ff7ade091fa81ee83a7a7b7491e4d8890d4d84e7a4e4292f7374"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
