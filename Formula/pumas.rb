class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "b787faaf52f6ec0fdeff128e553d881ad7b22c0cd43b3e41b1fe019973710c14"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.2.0"
    sha256 cellar: :any_skip_relocation, monterey: "df83d3e76d615565cceb62204de4002947ac300dbf453f251f1e838456f07f77"
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
