class Podsync < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podsync"
  url "https://github.com/graelo/podsync/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "eb3682f6de8d769ca89161dd8f0d5924f6498dadda4c8c16a46f8b9676423c74"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podsync-0.0.8"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "263729dacc4ff3f38e78654afb34ec883262b26f60f50df6839dc6ece3b33725"
    sha256 cellar: :any_skip_relocation, monterey:      "e03e6a9245dc2d77a28d4c903c85ee20a72010e1c5594d24917e732f09c7d57a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "62eeeb295510a781c9873efc82096b9174c91964dbebd46ab42ae8e182011e68"
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
