class Podsync < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podsync"
  url "https://github.com/graelo/podsync/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "614aac3a8857eb0c6fbce528748270df1af814557ab294ecb59a2fdcdb4f4d03"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podsync-0.0.5"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "5778c207d2066117c37e559d4cd9db777d36ac87c7b3e1a03a54ac2f329b4814"
    sha256 cellar: :any_skip_relocation, monterey:      "271259fc5db8d7cedd712b3c600d4d8700185df12b8455bf60aa9d291ddf0f3e"
    sha256 cellar: :any_skip_relocation, big_sur:       "1644832138799c229d4ff7c38c72eccc4d2f693d6482faf7c5686ef3b9ed1da3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5a538087c2f8e7cb3a6c33ee60798fb59c93c991a366ccc8b3101dc53b3e2b4e"
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
