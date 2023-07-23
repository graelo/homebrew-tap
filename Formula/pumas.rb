class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "fe33946efcedbede3e6f9c85c86b1b78398f5ecd6005577ffe1ff35c28dc2910"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.7"
    sha256 cellar: :any_skip_relocation, monterey:     "db06e05ac8d13227a194c10712a7359a1807f9236c0e14d7e8f0970931635b55"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "652f6329726d04b58159272075b2bedc0b5401b5f4d211760dd81892e8772c57"
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
