class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "b5f686ca7b795789e9919a7a1cfe460555415db6307b164fab1d17c614d15ec6"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.5"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "0b50e3c6bedaabf54465451d3fdd7c62819d6a1de7e5823feff1223d43b9dbdd"
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
