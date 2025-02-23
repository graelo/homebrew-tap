class Podfeed < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podfeed"
  url "https://github.com/graelo/podfeed/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "765c2c933ff7c06ce41e5cff016595df2326592ec29df68c8391709977be428c"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podfeed-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "86d4a233e7573d579ceb99ee29d7c2ae78990171e88a4609746dafe31516b89e"
    sha256 cellar: :any_skip_relocation, ventura:      "7b14dbc88c8188b6e1f066415e01521db7832fe4bf1a8f970e7d3683adb15152"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2fcebe40d2e1e6ca4d23b6aa9cf40e0b4cebcccc5e65fa54724e98877b114777"
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
