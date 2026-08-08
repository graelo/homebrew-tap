class Podfeed < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podfeed"
  url "https://github.com/graelo/podfeed/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "444c1b0cf279a4d6137891a0ee762349ed55f58294345027b2c1f5565fd0d4c7"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podfeed-0.3.5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "bfacbdc5b6e547be1ff869438833535493b06386159416bd20f18ec489c12ba1"
    sha256 cellar: :any,                 arm64_linux:  "92bf66dfdd1c2eb732ae00452179f72507359fe82bc9d7ff46e1a6d68afe3dc7"
    sha256 cellar: :any,                 x86_64_linux: "484ac49c4ffafead1399e9c2b16f11108164c43dfcf17019fb9786c15e81fbab"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"podfeed", "generate-completion")
  end

  test do
    assert_match "#compdef podfeed", shell_output("#{bin}/podfeed generate-completion zsh")
  end
end
