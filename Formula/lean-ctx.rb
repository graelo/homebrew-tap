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
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.12.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c90b4d1d7088123d913af9ccc9558187930a9434964599d86ab7b6bd42abfc64"
    sha256 cellar: :any,                 arm64_linux:  "acea686f537118e25c6b525f85d8c4d7b3a47c55fd8fde51cab3a0b7f9f8ecfc"
    sha256 cellar: :any,                 x86_64_linux: "9946a20cfcf401b05f14b7aed1d9ac8aa150bfbb8990989c7d09344e54fa1b7b"
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
