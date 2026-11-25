class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.7/lean-ctx-3.12.7-source.tar.gz"
  sha256 "e5ec3bef7257e33bd171f4a71f233a719bc8072ea963014044190e5f9f473f85"
  license "Apache-2.0"

  # Upstream carries non-version tags (dates, branch names), so match semver only.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.12.6"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0ac0e2a0fc1b6bd684d38e5ccfc6c6145d97abc9964ac0ced982882af914239a"
    sha256 cellar: :any,                 arm64_linux:  "2560f8c882fba048fb8c8d5f8734365812fb42de59bbf9d63ab185912e0c1f21"
    sha256 cellar: :any,                 x86_64_linux: "455cc0811eb7f5ffc5024650ccf226bf2215be531b9e5eb0280cb59349c595a9"
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
