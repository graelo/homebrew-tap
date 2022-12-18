class Podsync < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podsync"
  url "https://github.com/graelo/podsync/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "411be321fea917e63631248c8fc773511a19a475ac7d41b38d9ff3002da7bb48"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podsync-0.0.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "e3fbe696f2030b0e1129766e49839ae343a5747cd1b4e85cff49badf512375ac"
    sha256 cellar: :any_skip_relocation, monterey:      "60875a66c60c1e42b8dc7c01bea38665fae3a030c90bf1929376b6e4dc2b95ef"
    sha256 cellar: :any_skip_relocation, big_sur:       "9c7b3c5f091f692a66255362ce831c56e350d6da431ad7aff57f65ace3a1cbd1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bf90c24068cce0746e7580a909abedc63ca21f6104a89f7b19308598b7c574ce"
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
