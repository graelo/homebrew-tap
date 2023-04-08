class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "713e2af052f6113c238eeb69fff86cf3dc48098e0bbd9e6b50251bce022d4975"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.2"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "607ecb1f8c3ed175acbd8b74d0d402cfd0c5e0ccb15539459bdafbf8b4b45bc3"
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
