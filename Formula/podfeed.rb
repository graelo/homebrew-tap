class Podfeed < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podfeed"
  url "https://github.com/graelo/podfeed/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "267cd6d58ae7da8d0624a21dfb47cb0a5ec3cb3d2a7767ad835b566026502f2e"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podfeed-0.3.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "076e346a3d058bd42fbe1122dfa4a10412014e7f2925d0781501d8f30fe43e7d"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "8a4f52501d2d9527ff59bff57408cd9839ae31bd0f315f9e334bd78a14cb2e70"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6e0b08f803d09f9ccd4e099ab256709495e968c1b73404bd93e1a73992ca03ab"
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
