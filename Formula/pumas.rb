class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "903ca5a1f7e56f6d0bb8fcb865c2bdfe76fdbeddd634a1a8bca5c88c97d46564"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura: "a3bc5b845dab2b13b4f104a59623bebdfcafeb6820200753b5a3156d3ed4a012"
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
