class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.20/lean-ctx-3.9.20-source.tar.gz"
  sha256 "32dd725ff4c529dc37f95f7d844a94c304cd8ec3055fa5f7f7a2d18d54fb3e9a"
  license "Apache-2.0"

  # Upstream carries non-version tags (dates, branch names), so match semver only.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.9.20"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9a425c6b4b47fcee0ef23e6cf564fa5ad70d77327d6d14370459e89484ade6ed"
    sha256 cellar: :any,                 arm64_linux:  "b7f9c5ce9b64fc6fe47ac0fc6a4128ebcbda36f707be4c7365996ac8e84e4384"
    sha256 cellar: :any,                 x86_64_linux: "698f1283423cd0c6b1ec1ff43d239dc66dafa346d450cbc1a043ee80a11eb593"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust")
  end

  test do
    system "true"
  end
end
