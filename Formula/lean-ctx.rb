class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.4/lean-ctx-3.11.4-source.tar.gz"
  sha256 "401bf1dfb9c1ed268e1425717b73e3309768d5458e8fa52a1ae53cc9a3592b9e"
  license "Apache-2.0"

  # Upstream carries non-version tags (dates, branch names), so match semver only.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.11.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d4508ed2c8a04d8eed2997a3dd902c87afb9eadab55ddef643c86ba6a3a12892"
    sha256 cellar: :any,                 arm64_linux:  "72f674f668c36a92758c9921f3e415c4512818f2161f972acd8e4fbcfe7b5f0f"
    sha256 cellar: :any,                 x86_64_linux: "2ddd16a24543ee4498e6082d3029b46a0fb1c22154184e6cbe1844fae2c5b0be"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust")
  end

  test do
    system "true"
  end
end
