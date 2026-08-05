class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.17/lean-ctx-3.9.17-source.tar.gz"
  sha256 "a1178c682afcc4cbea3021338ac878761d8e8df4da03bf40bdd6f807bbdeac25"
  license "Apache-2.0"

  # Upstream carries non-version tags (dates, branch names), so match semver only.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.9.17"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e090c14c85a944a34daa7c0a7512a4d5e4597cf442496f11ffa50c2237f79ca0"
    sha256 cellar: :any,                 arm64_linux:  "00f803cd4a81c958d801b54c11d6b503b8d11e4f11fd83c1b48c72d338acdf5a"
    sha256 cellar: :any,                 x86_64_linux: "e64545949d4d925527ba9544d96c15bfd73c54bf01a122cca037b9d8b73f066e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust")
  end

  test do
    system "true"
  end
end
