class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.16/lean-ctx-3.9.16-source.tar.gz"
  sha256 "9380df2140d3d6cb93bf657e0681708fbcb830248017a61e097e784f38f46710"
  license "Apache-2.0"

  # Upstream carries non-version tags (dates, branch names), so match semver only.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.9.16"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "efd41f7a436463b232ae65adef25c9bb36ee222575ae798da4fe9e3eb254ff6a"
    sha256 cellar: :any,                 arm64_linux:  "e75c817e96e9626836b3d948852044313399451976b52cde188a69b5fbb14666"
    sha256 cellar: :any,                 x86_64_linux: "400b56ca47a8421757f4017ce1b7e6a2a586cfe6d10b6fcb35e3492ffd9dea52"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust")
  end

  test do
    system "true"
  end
end
