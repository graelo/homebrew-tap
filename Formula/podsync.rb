class Podsync < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podsync"
  url "https://github.com/graelo/podsync/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "3a23ed7bce17b189c93e9ddd2fb48e8ff51381dcb8e871742ce269577bb600c7"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podsync-0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "538c54a58db5d692bcd62a2d6933ee179841be0f23113d84c4165e8a0bcf1469"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b7c982ea79265c4816d3e91b93280f42f70db628dda8138c8bb1e216156d2a03"
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
