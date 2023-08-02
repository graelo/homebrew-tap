class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.11.tar.gz"
  sha256 "691b3892a3ee9f67bd22b05515eb1a3ba43e44b7b1f57f0af2d6c6bd6699352b"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.11"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "48995bb1eb8c34429bc18fc6a9016744214959bbae1f6614154a5f119a562b98"
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
