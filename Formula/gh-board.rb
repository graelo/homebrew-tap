class GhBoard < Formula
  desc "Blazingly fast terminal dashboard for GitHub pull requests, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "07875b7b18c67ef89731b500effa96f365e056f609bf1058788fb8b445700f9a"
  license ""

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
