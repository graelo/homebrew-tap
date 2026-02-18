class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.1.0.tar.gz"
  sha256 "792478954b76f4fb5cdb95cce537077a19914c68e94301cd7b97e4dc787a3052"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "41b2672de04b332dde7199137bf4dd8e34c037b0dc423eeb86316180b195a41b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "70f177a097e2d9966271744271988db5e062ded3651de01c768cf4f6b810b9fa"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
