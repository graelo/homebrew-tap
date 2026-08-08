class Podfeed < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podfeed"
  url "https://github.com/graelo/podfeed/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "444c1b0cf279a4d6137891a0ee762349ed55f58294345027b2c1f5565fd0d4c7"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podfeed-0.3.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7b4e6027d0c5a457c52adc12da7be0d079880a67b1fd0281fc9dd038e60c07b7"
    sha256 cellar: :any,                 arm64_linux:  "a083cfc303d7f427f9f2b615f003bcebb8644a9273b75f1f691e8f039363af3b"
    sha256 cellar: :any,                 x86_64_linux: "505c05a165ac6b16ecf343338b5cdf5597a836dd4debe4887e0a6962c52747f0"
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
