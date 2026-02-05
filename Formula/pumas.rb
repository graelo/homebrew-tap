class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "187c6e67d61506f4dc767647a5c2064339a4055e9327ee57ef9c50932cadcdb7"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.3.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7c45d1c27b3fa25866dab4c7c38d1a53358f4ac81da190bbe3dbe4049588c98b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "31232cde0b92e903138dedf26acd77c7d9f98c49e1de8fe5a6eb91b686f4c4d6"
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
