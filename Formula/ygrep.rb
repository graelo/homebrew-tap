class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.2.3.tar.gz"
  sha256 "65f883760ec7e23a48d4a9f16fc5ac5e501e7d2e0566ce58791b556cbe5023bf"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.2.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "da6cadfbaf11eb81dfea735397cda74ce84541cdebb4be38ff92c19f4c9bcb87"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "02af8d47baeffecb2b012fcdecceadf1ce98dce9e0d9bf677648916171fd363a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
