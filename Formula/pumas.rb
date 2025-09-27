class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "ec7f32fb5c67450f643ee3455071c1d9781a87bbd1efcaae624514153a9b2c19"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "da45f7e33d35a66938d20d1460f5714ed0e2f86153ab2c8977a0990692c505fa"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5d3eb72b3425f5c5beca8a3a22e179c21b0bafccbcc47358aa52495b01d702a5"
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
