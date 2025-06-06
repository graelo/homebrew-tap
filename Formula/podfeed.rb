class Podfeed < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podfeed"
  url "https://github.com/graelo/podfeed/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "712e77f13ff970c928abfc3d5fcfff5ff364ecaeba6735267ea65ee33efea8e7"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podfeed-0.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "3369f8feee1f53ff45b26ae49d8e873a2af6288daa8f90eb3b2f92d3bafdcffe"
    sha256 cellar: :any_skip_relocation, ventura:      "01990cc5f5f6cd0be2d1ab83c6a9e1f8161b8a5a5727a3241a364ac4f85d0774"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f2fe42e8d224d48db30b97909d17f385e0dca2ba3d888d34d329ac6df325de7e"
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
