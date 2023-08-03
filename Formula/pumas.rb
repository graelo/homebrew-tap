class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "183f66ee16652e8c374d05ef54adc1950ee707c595f56252f59c0fa3e187b738"
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
