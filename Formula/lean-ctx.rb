class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.19/lean-ctx-3.9.19-source.tar.gz"
  sha256 "8788494f4dacb2e8105f1d600b0abce9d9acb9fdff7f104da19895230419ff81"
  license "Apache-2.0"

  # Upstream carries non-version tags (dates, branch names), so match semver only.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.9.19"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c9c5153c8a7d38102799183f3472b1bde1f0b51cffea83e7551557d0157401f0"
    sha256 cellar: :any,                 arm64_linux:  "4fb48e0ded6a6839ef647d38224dddd2af201778121a9bea0f093a0b21b9c1e6"
    sha256 cellar: :any,                 x86_64_linux: "b6f03834bac707945ef533b3168c97152a810a9474c8e07bc5439f08088aade8"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust")
  end

  test do
    system "true"
  end
end
