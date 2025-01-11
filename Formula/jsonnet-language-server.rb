class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.15.0.tar.gz"
  sha256 "085085ad1c8c75cb178876726b5a974027058cab9a83dff6435aa5681f687517"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.14.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c9d2774bc1eba240fa53e3e1ffdae816f05b449c0c1c41d42c34fe792a1a6c0c"
    sha256 cellar: :any_skip_relocation, ventura:      "ac16aea87bedef54ba70303731aec056cb4b4c660db8f2514b5af703879c6d74"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dc2c086c6e3f25deab84e85e8aa12e605b15482af437a976cd5d5071fec5df69"
  end

  depends_on "go" => [:build, :test]

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
