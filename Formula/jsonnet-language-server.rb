class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "1b475e38c4ddc1000ac8abd68d1b876dbca25876225b865e684a4fc9e6ece710"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.9.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "dfd3be67e9c94c7008c72926141ff46aa7ce36d57a42e8e09d36c8ee88b2bb59"
    sha256 cellar: :any_skip_relocation, monterey:      "fb27a0c7ea3fe9d55bc8fd6ca4cb41f9ff808aeba74595b64b31f588fdb44504"
    sha256 cellar: :any_skip_relocation, big_sur:       "c5db7d27f813ac888458b60f05f0b81a8fef8d02acaaebd79fea45a12756107d"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
