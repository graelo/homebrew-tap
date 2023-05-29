class Podsync < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podsync"
  url "https://github.com/graelo/podsync/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "be7d7ae659dae9b03f44b1a7436cab25ed490a6a77064187e8022cbe8f019200"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podsync-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "96b5b8af16b20d9d7d63c09038807d98634532ce2e94f6d30cbfd7421a0ef070"
    sha256 cellar: :any_skip_relocation, monterey:      "71ab0d2eab6da6f6928ebf60b845417c208e404986ed052bfcd4f0cda6ac10cd"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5c6b77eb84612fdad3dd2dd8e6f02dbfbcb9bb52ee2a9bfe2c924bab2288168f"
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
