class Podsync < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podsync"
  url "https://github.com/graelo/podsync/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "3a23ed7bce17b189c93e9ddd2fb48e8ff51381dcb8e871742ce269577bb600c7"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podsync-0.1.1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b49cc1002e61a3cc52e63794fbcfc5cb321fc93b591346033b039b954bc1e850"
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
