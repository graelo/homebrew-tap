class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "3e6720c50467f7994cbc2d5aa135a34fcc7cfe3e5c31810a809af7a351b184f6"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.3"
    sha256 cellar: :any_skip_relocation, monterey:     "f1e9670343b4fd6bd14c770944c0671837e684823681b444e907793a7f4dcbe9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c05061fc951a977224aea1973127a145505309d96a0fdefd0c08b2d692a136e4"
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
