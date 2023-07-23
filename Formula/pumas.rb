class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "fe33946efcedbede3e6f9c85c86b1b78398f5ecd6005577ffe1ff35c28dc2910"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.6"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "cad3aa9d2a2513efeec1f2166fb1935ab6d2bc66d10374bdfe6470a78b09b649"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"pumas", "generate-completion")
  end

  test do
    assert_match "#compdef pumas", shell_output("#{bin}/pumas generate-completion zsh")
  end
end
