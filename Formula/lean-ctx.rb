class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.1/lean-ctx-3.10.1-source.tar.gz"
  sha256 "224367f308b5e49ae5b68d23a17818ca6497f155dcff045d36e12acb82f8a091"
  license "Apache-2.0"

  # Upstream carries non-version tags (dates, branch names), so match semver only.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.10.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "aa0f95f7cf2f652e100f8f5c75bb74b8a5d866daddc9cc851ec9a919637c7694"
    sha256 cellar: :any,                 arm64_linux:  "6c021b6a0b018acd0f81709df6804634732d05a19c904d17fa71cd2fce4243a4"
    sha256 cellar: :any,                 x86_64_linux: "fa9b75339612756c380f6be6d425ed22255435c2646470781a4c7f98c2af6878"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust")
  end

  test do
    system "true"
  end
end
