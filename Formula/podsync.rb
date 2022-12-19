class Podsync < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podsync"
  url "https://github.com/graelo/podsync/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "760c6ee99055c3b7d55032cd070a4d53a8163bcc2e17fea8e2b571489327df84"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podsync-0.0.3"
    sha256 cellar: :any_skip_relocation, monterey:     "862130c3bb9ddd20a22fcccafcde1c0d36c0ae78a2ae73319a9c1e2c70b84383"
    sha256 cellar: :any_skip_relocation, big_sur:      "8ebff2c064b61ef484fb1624aee97b399f716ba2d82bdab43946ce4fcd0e581c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7100da891c7f74c288cf4bba6cd0bd23f6ebb2e423866d89f3237086632ad4f9"
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
