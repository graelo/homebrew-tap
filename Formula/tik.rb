class Tik < Formula
  desc "Count LLM tokens in text files"
  homepage "https://github.com/graelo/tik"
  url "https://github.com/graelo/tik/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "b8e8759e43bda5c80859e11b836733a8b29ec83b73f0bd98ad679e9794d8aa37"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/tik-0.2.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "bf379a9bf99fea4a414d842828acd6913d460d40d4f1e5880ad2eec8dbf9cb2b"
    sha256 cellar: :any,                 arm64_linux:  "5b2ab7d6023eff4d605b23470ce7489c779321ad08d7cae695590071d467fc5d"
    sha256 cellar: :any,                 x86_64_linux: "468a1b2b5980d89a8c97c91e80cf551572ba4bb92b27f17334688cd1cd0b77ba"
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
