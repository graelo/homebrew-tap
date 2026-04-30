class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.4.5/lean-ctx-3.4.5-source.tar.gz"
  sha256 "2ea734c9377f3b3f4adca105a1e045f902e605e6de7561ec49445ec88d41db5a"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/lean-ctx-3.4.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3577c952f5933592b9f7eb03d84382d541004c3e3c813058fe29a35badf61be1"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "c362c31af1e9b5d4d9dba4773d601a13ebf72a5e2265a801f990bc65d863bdba"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8e1743cbafacf4e0f35fbf1727b7a1e4c7db91350c36fa730a0a52257b27e8ab"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust")
  end

  test do
    system "true"
  end
end
