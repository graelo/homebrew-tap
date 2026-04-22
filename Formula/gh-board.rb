class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "93faf865d161aeb91b999a06dbaab31b4525327c35c3ba1225db5b5d115f6e62"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.13.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "82c1bcb958d7a01f64bc160b66b0b3a910ad08bbc182950e0b9fbb803be22fe5"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "28866ab12c4119744be3afc7b5efaa92994df4ce1e4137b4e96c3dd606e78975"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "536503155e54ee6953163dbc678fd73c84a69fc341a5d3dcb8d232886af33b22"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
