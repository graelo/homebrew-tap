class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.16/lean-ctx-3.9.16-source.tar.gz"
  sha256 "9380df2140d3d6cb93bf657e0681708fbcb830248017a61e097e784f38f46710"
  license "Apache-2.0"

  # Upstream carries non-version tags (dates, branch names), so match semver only.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.9.13"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b688824ea8ce7ecfc73530e3a7e5b286b2e1ae43b6fdf658479239f1dbb7cc2b"
    sha256 cellar: :any,                 arm64_linux:  "af179963beb936d8069ec2d68842ed580c597e72badb01d35cc5605eea080329"
    sha256 cellar: :any,                 x86_64_linux: "55a51f19a1a25ac418733fb34a7aab75d9624677ea06685284e636a1d30b01e6"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust")
  end

  test do
    system "true"
  end
end
