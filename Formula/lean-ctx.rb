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
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.10.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "050525fbac62755045e3bb1004543dfca5d4ce683ed6c1b832c26cc5ed45bd8f"
    sha256 cellar: :any,                 arm64_linux:  "da8d4ef5faed0f8146f5cdb405be71f264c396271b0dc2b42c2018da753761be"
    sha256 cellar: :any,                 x86_64_linux: "6f3fe018973a656ea3faf033ec0f47f12d78b00fdf58fd36f722b8d1dcb51e7f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust")
  end

  test do
    system "true"
  end
end
