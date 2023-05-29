class Podsync < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podsync"
  url "https://github.com/graelo/podsync/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "be7d7ae659dae9b03f44b1a7436cab25ed490a6a77064187e8022cbe8f019200"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podsync-0.0.9"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "03c0cf1c20f55ea413b9cb2252f354b9f890a625c8ef0d71453dc6d58fe0a0e1"
    sha256 cellar: :any_skip_relocation, monterey:      "f5507037dcb9c993972d162384c2a16272d2001f680b2bd1e51178ae334944ce"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "de547f7fb81d17f526d5ab4520556e180ce72de0df2bbc208f2b838709e51656"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"podsync", "generate-completion")
  end

  test do
    assert_match "#compdef podsync", shell_output("#{bin}/podsync generate-completion zsh")
  end
end
