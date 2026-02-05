class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "187c6e67d61506f4dc767647a5c2064339a4055e9327ee57ef9c50932cadcdb7"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.3.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4e203e7b64cfd3e9cc1884971a22e6f87b9ac6fb866ecb0642910f09128460b5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5dbd5a4bc7db0bf36bf67f32ab1ebbc8697712bb4e3580be9282106c990b9ca9"
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
