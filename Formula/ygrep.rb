class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v4.0.4.tar.gz"
  sha256 "8e037547ed42276c65c194013a313e36988469f85d5cf18a0513f3b068beeb81"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-4.0.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "785552c51cc026b925f73e403d71dfafd04b95638d2481577aae57f91ab76158"
    sha256 cellar: :any,                 arm64_linux:  "2e60fdf45d49ba005f25b04c21082bb17eb2ede59b2bf9616d451d906fbd50af"
    sha256 cellar: :any,                 x86_64_linux: "e34a4cbbf9d0d7251f5fb3102fb341c1c7cf4f2e1c4185ce797f8654d7f1a82f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
