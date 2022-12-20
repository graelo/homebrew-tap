class Podsync < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podsync"
  url "https://github.com/graelo/podsync/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "dd3132e32fb973adea451e8498e24b735922fab2f92910bdf83d022ba30bb7ab"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podsync-0.0.4"
    sha256 cellar: :any_skip_relocation, monterey:     "4d08fae72a133dc17a477e12e5c42ff7c3c3d1b3ab6192632144674b0614af57"
    sha256 cellar: :any_skip_relocation, big_sur:      "3d058a6fd6d7a8a1ab79af4409c09ab58f84a2aa4192245342715d811e7a2132"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0d5931a4d55a1dca12e82656c1e6fd359fef7d80d8ad785f211b8292a14dbcb3"
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
