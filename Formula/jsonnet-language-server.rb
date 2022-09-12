class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "1b475e38c4ddc1000ac8abd68d1b876dbca25876225b865e684a4fc9e6ece710"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.9.1"
    sha256 cellar: :any_skip_relocation, monterey: "90966bf24c677486875e1e0ba09963992896d6ce64d1e514b4044c741d75f0da"
    sha256 cellar: :any_skip_relocation, big_sur:  "c010fdad9b2782fc41b8cd45d623ede80c156aa5cdd4b7a19f8296064facefc2"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
