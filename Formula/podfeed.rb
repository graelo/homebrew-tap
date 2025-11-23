class Podfeed < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podfeed"
  url "https://github.com/graelo/podfeed/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "5bce3dcb44415664befe6662680df673298c97fe5e8c74fd6fed6f7a7e205872"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podfeed-0.3.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a66c7105d0bc7a063fe622975b6bdc3c076c74bc038226c10a36152307b984d2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "496decbb068cf32cdab5f6f45a60312c3af8dd39772b62419426ae9321d6e373"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"podfeed", "generate-completion")
  end

  test do
    assert_match "#compdef podfeed", shell_output("#{bin}/podfeed generate-completion zsh")
  end
end
