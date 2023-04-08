class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "713e2af052f6113c238eeb69fff86cf3dc48098e0bbd9e6b50251bce022d4975"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.2"
    sha256 cellar: :any_skip_relocation, monterey:     "5533a764a4b8d71dfac9d8fe167a6b3e585fba2e696ea4f6fd220c1676e2e0a2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1b8ba08de5f17a7b35ebbec824510ca27d1f1d1c25fc3428f45dbbb6705902b4"
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
