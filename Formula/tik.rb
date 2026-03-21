class Tik < Formula
  desc "Count LLM tokens in text files"
  homepage "https://github.com/graelo/tik"
  url "https://github.com/graelo/tik/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fecba41e18ab57295ec1c1c8612b77b446b39469e5b44cbaf7ff2a705312287c"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tik-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8cf946900a975e38d9ce2b1b513156e3277a83b1468b2998d6682710b2e4a93c"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "14e5ec57cb28703b6594224866bc77a36bba2b096337f7bfbe3a3265f46bdba1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "54d4c990a400acebc2715c88cdf2887a214b4c4e1c60fed0fcd5866ebc7e21f5"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"tik", "generate-completion")
  end

  test do
    assert_match "#compdef tik", shell_output("#{bin}/tik generate-completion zsh")
    assert_equal "2\n", pipe_output("#{bin}/tik", "hello world")
  end
end
