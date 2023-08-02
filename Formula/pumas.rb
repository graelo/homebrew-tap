class Pumas < Formula
  desc "Power Usage Monitor for Apple Silicon"
  homepage "https://github.com/graelo/pumas"
  url "https://github.com/graelo/pumas/archive/refs/tags/v0.0.10.tar.gz"
  sha256 "0174afa8adda2990cad63f5c3be052c2383af57a2f2eb162616943c2b33def20"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/pumas-0.0.10"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "81bd49ddb9ebc944defd1c32f1f6f7cadade7a2f2368ce26ceb566f16c42b17d"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"pumas", "generate-completion")
  end

  test do
    assert_match "#compdef pumas", shell_output("#{bin}/pumas generate-completion zsh")
  end
end
