class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "cb245df92d9c24757194d33c7cf0370fee917b72afbf58dd95db9c5b7e96a51a"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.4"
    sha256 cellar: :any_skip_relocation, monterey:     "7452b9ab78a8de36799311a07c2f210f08b56fcccb8bb999b38e6800c4ba06ae"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fccac9782e0ab94b227a2fb6e176e855a48a8374ce9404592ef8878338d61d58"
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
