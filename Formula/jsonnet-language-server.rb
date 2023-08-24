class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "8f482d54532243e634c913b3299ff36eea69e815b1a98fd693eaef7bfdf82217"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.13.0"
    sha256 cellar: :any_skip_relocation, monterey:     "afa4511540ebbc54432c3a7e36827b19abf71034bf822f2c5d755b4e13329b3f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "117f538f97d646f739eb3b9f35a119060bd909b447311ce200109c3306952e3c"
  end

  depends_on "go" => [:build, :test]

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
