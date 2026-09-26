class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.3/lean-ctx-3.10.3-source.tar.gz"
  sha256 "3b24fc5726d24e457768ddb135c6e8e25b9a0618ef164cb04d16705df29d2c5f"
  license "Apache-2.0"

  # Upstream carries non-version tags (dates, branch names), so match semver only.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.10.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2793001f3d9dcc9e01d6a793a888d9f43b05e2bf5e9cefe3b6e6925e08c720b4"
    sha256 cellar: :any,                 arm64_linux:  "0dd9b324ca1e43ce908727b5b9da4e36d36ddbff448ecee1e97e5c6330808b37"
    sha256 cellar: :any,                 x86_64_linux: "315895f37cceb852569fad5c78b93a4a68134a7edfbd83830a1242c25d7399bf"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust")
  end

  test do
    system "true"
  end
end
