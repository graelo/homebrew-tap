class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.0.3.tar.gz"
  sha256 "c94805820af113d8ba1ec33d8261470be6080e7332070cd57741ad6dddc60a9b"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.0.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e0991db85b12d6222e837531e4abc08ebfce8cd1f720140a757d0836eaae34f1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1a38993564a26bfc73ceb16aebac86cb361f0f170a40e52b4b561e4f119c23e4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
