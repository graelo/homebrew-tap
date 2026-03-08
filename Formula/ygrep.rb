class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.2.3.tar.gz"
  sha256 "65f883760ec7e23a48d4a9f16fc5ac5e501e7d2e0566ce58791b556cbe5023bf"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.2.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4dbb044bde9ecb394fdffce2d88910550d398c116adf7cb1042798842c361c80"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ca653f49d6fec0a875cce41a5a24139cc5ac32e9b2c3435d0e24ebc7db45e86c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
