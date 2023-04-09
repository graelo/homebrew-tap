class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "3e6720c50467f7994cbc2d5aa135a34fcc7cfe3e5c31810a809af7a351b184f6"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.3"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "6a3a737f1a3b50067d3537d6548acb32ef3a70fb2144cc4fb14d6bc14eba27ad"
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
