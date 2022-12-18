class Podsync < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podsync"
  url "https://github.com/graelo/podsync/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "411be321fea917e63631248c8fc773511a19a475ac7d41b38d9ff3002da7bb48"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podsync-0.0.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "709f52409aea5410c3988118a48da23a254f97fb73b05a2f040ba905450ce6f2"
    sha256 cellar: :any_skip_relocation, monterey:      "d8766fec0d0254a6f888c31f99d14d1a6e2682bf6d345eb9a08f14ceea0107b9"
    sha256 cellar: :any_skip_relocation, big_sur:       "d9c896a0558f4b12657ffbdd69504276998becfed9a0b96eba3ee57b89b4c4f6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b91b27c7e7521f523eec98288fcf00d0531b35722f19add8ff9f4d92a3c34b9d"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"podsync", "generate-completion")
  end

  test do
    assert_match "#compdef podsync", shell_output("#{bin}/podsync generate-completion zsh")
  end
end
