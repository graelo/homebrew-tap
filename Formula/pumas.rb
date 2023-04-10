class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "cb245df92d9c24757194d33c7cf0370fee917b72afbf58dd95db9c5b7e96a51a"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.4"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "b1f9e8ff0877e82679db547cafb5823eec7c5c1cf1b95af394934120ea8d209a"
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
