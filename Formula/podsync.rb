class Podsync < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podsync"
  url "https://github.com/graelo/podsync/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "eb3682f6de8d769ca89161dd8f0d5924f6498dadda4c8c16a46f8b9676423c74"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podsync-0.0.7"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "6570b4a7f131dd2944495ce5d04aa2c28a49a096d4d3560f5bc9eac9095ae950"
    sha256 cellar: :any_skip_relocation, monterey:      "653a3bdb81cdbfff734da82440aa71401ad33a7f3a9c0180cb62ccce8db0970f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2c487c420916d23f6b87a4ea31079f0428b5abc00512c0df3d848369adc305f8"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"podsync", "generate-completion")
  end

  test do
    assert_match "#compdef podsync", shell_output("#{bin}/podsync generate-completion zsh")
  end
end
