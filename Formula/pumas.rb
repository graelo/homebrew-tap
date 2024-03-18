class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "d5f98954e0cae22d9d9d07afd6f292302a4436cfe058b7028b6cc2c9df1abcc2"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.2.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "958e31b0b02638e45c09ff971c91373130eedfafc036b9fca89078039b74051a"
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
