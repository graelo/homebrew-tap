class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.2/lean-ctx-3.11.2-source.tar.gz"
  sha256 "91aa812c1b06e8cacdef52b624be403972f5201d7ad711840d9a4e42e740913b"
  license "Apache-2.0"

  # Upstream carries non-version tags (dates, branch names), so match semver only.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.11.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5d2d05a7096b2eee8a6937a5133903ae23fdbaf8a90736f7526db8ca1a631ba7"
    sha256 cellar: :any,                 arm64_linux:  "c3cf57396cd06a51e471c315d849099a156eb7e72b4e5a80258ffe4b2777471e"
    sha256 cellar: :any,                 x86_64_linux: "a5739f32f82d2202f77d71eb149af944ed6552533c12c6d8032168b75ae642c1"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust")
  end

  test do
    system "true"
  end
end
