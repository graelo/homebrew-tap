class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "4dd8c71c99fe396fbac15ec6bca6910214d431e5ca759811f66f4142b2b81e6e"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.2.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "bf85d7a610153e88d41f2f7bbdf114ed38b0cae2664194eeeed094aa7cb60b01"
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
