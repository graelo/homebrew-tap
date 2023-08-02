class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.11.tar.gz"
  sha256 "691b3892a3ee9f67bd22b05515eb1a3ba43e44b7b1f57f0af2d6c6bd6699352b"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.11"
    sha256 cellar: :any_skip_relocation, monterey:     "2dcefdcc4f5fb4391e9401840ee95f1f4ac0f423480856d8004911ba5011861a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "84f74d4397c08c50e978afca8ddbb393dd5ac66c247c79bd5c05b0fc5c291753"
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
