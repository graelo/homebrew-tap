class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.8/lean-ctx-3.12.8-source.tar.gz"
  sha256 "94bc455c6014a74e992d4e8cfe123f5d85a776f59473559e8a891b98442c401d"
  license "Apache-2.0"

  # Upstream carries non-version tags (dates, branch names), so match semver only.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.12.8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e252eff97dc8c316c7414aef3da366f5dc35da57aaad9f233fd3598523aa7330"
    sha256 cellar: :any,                 arm64_linux:  "12a0e6ed854833600b9863eca01ee7a88bb1aa288f62deba1bcc4f62539bd13a"
    sha256 cellar: :any,                 x86_64_linux: "725322c75a426e8bc933bff98a8aabe059a0e97bcc603c3b7804210f81291452"
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
