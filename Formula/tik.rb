class Tik < Formula
  desc "Count LLM tokens in text files"
  homepage "https://github.com/graelo/tik"
  url "https://github.com/graelo/tik/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "e460541eef9e2c639d74c1ec376327242ba74e107a7e156e0719a17893e75f2c"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tik-0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "efd9f29c0d006d8d4ab62a16db3d66a534992d48b71de2c7aa55b6f48674a109"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "1f5dc92c039e95bb9dd5e9e9282e547de307375550f5dda184cd0d2278babfd4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "274f59884efeb42f91cc6d400aa21fe7e28cd4585899cade82dbb269f0d2b763"
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
