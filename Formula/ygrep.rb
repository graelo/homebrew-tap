class Ygrep < Formula
  desc "Fast, local, indexed code search tool optimized for AI coding assistants"
  homepage "https://github.com/yetidevworks/ygrep"
  url "https://github.com/yetidevworks/ygrep/archive/refs/tags/v3.0.1.tar.gz"
  sha256 "76efd3ee08ea3f6a769916107469d2f177a908d680daed81cf740077b5f50931"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/ygrep-3.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e92946fe99b2f838146843e33a8d22bd9310a788f3cf12133cfba6a706346e9d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "675d5b542b87d3068b501d8c092bbfaa22e15ea86cee0c0cbee820535816ed8e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ygrep-cli")
  end

  test do
    system bin/"ygrep", "--version"
  end
end
