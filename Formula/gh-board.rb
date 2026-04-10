class GhBoard < Formula
  desc "Fast terminal dashboard for GitHub PRs, issues, and notifications"
  homepage "https://github.com/graelo/gh-board"
  url "https://github.com/graelo/gh-board/archive/refs/tags/v0.10.2.tar.gz"
  sha256 "5f6397ee3ed41eb6c19df7ccd5e4419c6c3d78e55df21884def4ae4ef4566ef9"
  license ""

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gh-board-0.10.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d6c045b6acc86bcb29970c360524471c3b219bc3102753f0463d35c7cc130d50"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "f16d46569510b8936fc81a61f49f64e31337e3f70387901501a3115e61484541"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c0010f42ca177690619be88c5c866b9355b7ca265624b680426f41381298cd13"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
