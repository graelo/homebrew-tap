class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "183f66ee16652e8c374d05ef54adc1950ee707c595f56252f59c0fa3e187b738"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.1.0"
    sha256 cellar: :any_skip_relocation, monterey:     "34e5be8a317356379c4ecfe60748f94fba5c892459c82c71df2ebe2f23eafdbe"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7585490247a8963db7d74c368648f6575d8a2da93449166afaa75dfa6268c57b"
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
