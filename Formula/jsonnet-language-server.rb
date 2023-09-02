class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.13.1.tar.gz"
  sha256 "00341c5bd1ea8b2eb2be61cc26cdba5a6c6b678c30d9b3f55a625e8db40d1bfa"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.13.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "02770ab21f14153cebcddf5965c9eebdcb654798d6abee9b3b26a79ee97f754b"
    sha256 cellar: :any_skip_relocation, monterey:      "afa4511540ebbc54432c3a7e36827b19abf71034bf822f2c5d755b4e13329b3f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "117f538f97d646f739eb3b9f35a119060bd909b447311ce200109c3306952e3c"
  end

  depends_on "go" => [:build, :test]

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
