class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "b5f686ca7b795789e9919a7a1cfe460555415db6307b164fab1d17c614d15ec6"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.6"
    sha256 cellar: :any_skip_relocation, monterey:     "7f530e2df74934a5c6da25f02d137ee32b67ac850f30ac4ba71281a7d534c10c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "20cfc5582e3d947caf7544b05efa9f49777930ffdb18cd1ef34664c63c047800"
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
