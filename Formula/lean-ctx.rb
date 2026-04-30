class LeanCtx < Formula
  desc "Context Engineering Layer for AI Coding"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.4.5/lean-ctx-3.4.5-source.tar.gz"
  sha256 "2ea734c9377f3b3f4adca105a1e045f902e605e6de7561ec49445ec88d41db5a"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust")
  end

  test do
    system "true"
  end
end
