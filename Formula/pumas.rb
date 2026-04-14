class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "0db9699d9d173830ca73b1e1cbca408fa4f1bac5f043f0aee8e1c361f265009d"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e8083e8d4e476c352f739a25982f3d64898af2712e010d06e137eea5e600384c"
  end

  depends_on "rust" => [:build, :test]
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"pumas", "generate-completion")
  end

  test do
    assert_match "#compdef pumas", shell_output("#{bin}/pumas generate-completion zsh")
  end
end
