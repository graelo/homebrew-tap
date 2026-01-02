class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "fa713359ee42043d0afeb09a73c2b4214b7298b31b0a5588b7c6539001f03545"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "179669a1e3226cdbc8f9cb32b19fde9de6bc832a80057c8bff77225a609a5954"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "285542f2b734f063ae2dbb25850d7209871613b7b776efa27ab22b0d7ae5df15"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
