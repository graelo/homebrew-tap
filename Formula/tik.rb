class Tik < Formula
  desc "Count LLM tokens in text files"
  homepage "https://github.com/graelo/tik"
  url "https://github.com/graelo/tik/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "92921ed43dc5f22f31d52d89209e1b7b791c37a38b01ee28d9b695b6bba1eb4e"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tik-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9565dc1de81df4a440f23068f7e1d77bc24497df780170b0866f3f3d76a882e9"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "97a86db9cda18ef316a2de22c8387e8355f675030faa5b24a5111fa0232f842c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "67cc4433f0f319cb06d920a7f67094f2b25fdffdc063a38e7155909c50249f4f"
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
