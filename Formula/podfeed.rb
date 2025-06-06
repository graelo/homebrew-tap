class Podfeed < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podfeed"
  url "https://github.com/graelo/podfeed/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "923a6c001588a6c277ebba38f3f48363697be40f665e38fb9665f9e441db64fb"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/podfeed-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "31d5a6627b55f10282a44ce8e2d2610c2d1d6ffaf975706e521df22effa8f394"
    sha256 cellar: :any_skip_relocation, ventura:      "54735e5f3d500f5a182f67fb017ae3182e296df4d70f7fd9ab756d2d8e2efc19"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "327cfdd2b336bd4dccf93b6124e24632f9b389ee1e723e3cdf5021e5c056b77a"
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
