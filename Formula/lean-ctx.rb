class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.5/lean-ctx-3.10.5-source.tar.gz"
  sha256 "3235fddead565b17be0a720779cb3ca3e73a10aa096acdb233e0348ff63bad9a"
  license "Apache-2.0"

  # Upstream carries non-version tags (dates, branch names), so match semver only.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.10.5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "717193e603fad1050aa56c8253434f094f8b777d03c070d20e9f61f97ca9be61"
    sha256 cellar: :any,                 arm64_linux:  "4aae77ee091a5c1cb508c0d0254ddd7b2a040c8884bc57577365927d5e5aedbe"
    sha256 cellar: :any,                 x86_64_linux: "55e3efbdb73dcb8490034ba010f066d929111c7b3fed6f1b3b0b27ae68289512"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust")
  end

  test do
    system "true"
  end
end
