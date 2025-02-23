class Podfeed < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podfeed"
  url "https://github.com/graelo/podfeed/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "765c2c933ff7c06ce41e5cff016595df2326592ec29df68c8391709977be428c"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podfeed-0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "294e2364d241f54f880782bfea8e7060041f4ed50c2ddc04b3281e9b70193eed"
    sha256 cellar: :any_skip_relocation, ventura:      "e12e6216a31190f2117110de48c867f82e7e103ae7a19755c93f6f5fa3edc35f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7d1e4f24ccb9acd5e723395a35cf66ecbcb390bad700c527c9c96c4b572ce56e"
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
