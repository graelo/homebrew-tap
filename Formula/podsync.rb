class Podsync < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podsync"
  url "https://github.com/graelo/podsync/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "cfc4ad0076ef1818b827973733ebaac2ce72e04e0743b6813b6d60a36114d441"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podsync-0.0.2"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "14b899657a8e0f68223e9059d48290c9f5d48e8d321421709c0fcd62aae308ea"
    sha256 cellar: :any_skip_relocation, monterey:      "798b7e64b22ed0ec58497e9c041070138414eacf8b46475de5af53faf20a65b0"
    sha256 cellar: :any_skip_relocation, big_sur:       "f9c2ccca6441b3b35ccb06b45b695a6d845d4706c4b61e4407b747de00a806a5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a73db03d5ee9222588b72bc9be5711ded35e7727fffb83ea26d8167cf81bb677"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"podsync", "generate-completion")
  end

  test do
    assert_match "#compdef podsync", shell_output("#{bin}/podsync generate-completion zsh")
  end
end
