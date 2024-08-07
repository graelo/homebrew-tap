class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.14.0.tar.gz"
  sha256 "b24835338786c97e8be3609e98cb7e8af70d5ed02da23d144bc1cfbab15f6abd"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.14.0"
    sha256 cellar: :any_skip_relocation, monterey: "01d3bdb0e7759f58d9fee76e01c404060b53255b1e81ee76e9d80232538af068"
  end

  depends_on "go" => [:build, :test]

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
