class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.1.0.tar.gz"
  sha256 "792478954b76f4fb5cdb95cce537077a19914c68e94301cd7b97e4dc787a3052"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.0.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5fd4959ff0a8e750223a6bccaffa02c9c72a7a5ef4317135a20ba9d96d108d37"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ee11c181b087ffe36804404fe43afc32c354dd5fb753b19c39350cf25ce88f98"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
