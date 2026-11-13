class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.4/lean-ctx-3.12.4-source.tar.gz"
  sha256 "748dc85ade919090b297d5e23fd4bb4b3a99d967533e8f6ea8069f115014cbdb"
  license "Apache-2.0"

  # Upstream carries non-version tags (dates, branch names), so match semver only.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.12.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "36233916aef0f78b22f3d42260464d00ff90c04fbed769f94aea8e74147922a0"
    sha256 cellar: :any,                 arm64_linux:  "cb363e5630b7b7737cfc082b1ba15fe4bd378b48c6be24de5524a183158d4e4b"
    sha256 cellar: :any,                 x86_64_linux: "1675c42c4e6f81d60b0aebc01c8b7a93404e5cde67fe2cec5c4c767d114aa1cc"
  end

  depends_on "rust" => :build

  def install
    # Upstream v3.12.1 turned `rust/` into a library-only workspace root
    # (lean-ctx-engine); the `lean-ctx` binary crate lives in crates/lean-ctx.
    system "cargo", "install", *std_cargo_args(path: "rust/crates/lean-ctx")
  end

  test do
    system "true"
  end
end
