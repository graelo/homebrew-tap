class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "639f56e6160555d837f8816860c1007f5b4ed4227be1ee5612e56a711b26426a"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.11.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "3eecd69b64b59778e5d043931e4cdd29c2a732dc03c71c5b3d3c4d184b58d1df"
    sha256 cellar: :any_skip_relocation, monterey:      "996737f0cb37d3d708f31c53b26bd72cf5f1534a37fb083beb2af34c15c4804c"
    sha256 cellar: :any_skip_relocation, big_sur:       "280fcb270d2822727b7817e3066b6766e0047b4f2e4f82a72d17de7da34813eb"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5bb04329fccee4030629dd6fdf9f6df1dd7b4b0a2ca90c23c58faa5eff6e1205"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
