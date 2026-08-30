class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.0/lean-ctx-3.10.0-source.tar.gz"
  sha256 "b9a7e900ff874ae0621f9e15e351188df9f0f39cef558c3e9087b00f4631ac2b"
  license "Apache-2.0"

  # Upstream carries non-version tags (dates, branch names), so match semver only.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.10.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ec999d9db0f89a9bb70eed399d9842cb5068d17151a6ce39f6456fd352220e92"
    sha256 cellar: :any,                 arm64_linux:  "c17dd6809df279540a9a2493c453a71fe40adaf1a3e8e333795eeb4a3b94d45a"
    sha256 cellar: :any,                 x86_64_linux: "ea8a1bb5eb0ac2a080823edd888b8c849bda1cedd9d38327908e472e0dc419f5"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust")
  end

  test do
    system "true"
  end
end
