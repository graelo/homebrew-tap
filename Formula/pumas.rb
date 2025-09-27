class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "ec7f32fb5c67450f643ee3455071c1d9781a87bbd1efcaae624514153a9b2c19"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "451afef7da09017aa75cd56454f7dc152973670f27d1867b911d493d83c192a1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1377f93e2ab03a99cea43d74588cc5994de96bafac8652db8e4a5c0b029d8bb8"
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
