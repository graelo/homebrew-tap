class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "713e2af052f6113c238eeb69fff86cf3dc48098e0bbd9e6b50251bce022d4975"
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
