class Podsync < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podsync"
  url "https://github.com/graelo/podsync/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "e5157d32000f334dacb62fde35b2094735bbc779afcea5cb7b1ea25b194aeaeb"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podsync-0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "294e2364d241f54f880782bfea8e7060041f4ed50c2ddc04b3281e9b70193eed"
    sha256 cellar: :any_skip_relocation, ventura:      "e12e6216a31190f2117110de48c867f82e7e103ae7a19755c93f6f5fa3edc35f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7d1e4f24ccb9acd5e723395a35cf66ecbcb390bad700c527c9c96c4b572ce56e"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"podsync", "generate-completion")
  end

  test do
    assert_match "#compdef podsync", shell_output("#{bin}/podsync generate-completion zsh")
  end
end
