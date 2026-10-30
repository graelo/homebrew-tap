class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.0/lean-ctx-3.12.0-source.tar.gz"
  sha256 "a1009099b7933ddb8948d6511a38c4f9addfcfbc60c0a54161adea174e32bfb5"
  license "Apache-2.0"

  # Upstream carries non-version tags (dates, branch names), so match semver only.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.12.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "45ba2f364e66275941f4de9f619d71df111577ecd95548c10edd54434712895b"
    sha256 cellar: :any,                 arm64_linux:  "8f3e481a910be2f6e4a12ec115767b4e8f7e7dd6d11ca31fde8759c0102c5b28"
    sha256 cellar: :any,                 x86_64_linux: "560722ec57f2cc749c408e18e60ae470499efe6d1b022adf9b392e1b27f2839a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust")
  end

  test do
    system "true"
  end
end
