class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "aae4596bef0790367e9b7e2c5cb1572a48a190da3a7484ec5e66c615ea221ee2"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.8"
    sha256 cellar: :any_skip_relocation, monterey:     "bb48f1eaea0fbb3834b5b0520c745e40ff2ca6114c99b26c8f19349df1083ec7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "67f85fcdd192f6e369eac266dff09a00b4d77659f2c068f0ceb30f999bfb4a83"
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
