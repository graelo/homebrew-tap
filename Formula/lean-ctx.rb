class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.18/lean-ctx-3.9.18-source.tar.gz"
  sha256 "1292776f9549307cf3feade95d75411ba6fce24a9f96d4a07ad6146884686350"
  license "Apache-2.0"

  # Upstream carries non-version tags (dates, branch names), so match semver only.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.9.18"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7011e8e0690644369e59a63b64088cc5bafc604926a09df60d0e90a979600ef7"
    sha256 cellar: :any,                 arm64_linux:  "62114cfdd6e7b9e8e5a20a1b078ea4ff9de5b0a95344a2dcf3610845bc61bbda"
    sha256 cellar: :any,                 x86_64_linux: "eec5228ffcf8172d15cf56196a734876a54e9cab5006783e520b075ba3a2f705"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust")
  end

  test do
    system "true"
  end
end
