class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "f337209349f493bfc5e3cc273bc1e1eab06c5b4618794b52285192270250d2b0"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.5"
    sha256 cellar: :any_skip_relocation, monterey:     "478f1d52fde7c2d57d4879e4c566010e076fc5aa273c144ef7ce43d22ecadec0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b64fb3e5bc1fb5ea67d32c51987b94e6a0b1dc346b19cfb8741d89e8948f39d1"
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
