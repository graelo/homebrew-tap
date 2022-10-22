class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "072640c6317cd3dccec1cab2e253f1c6e1ea4c15dee42505ea0a3407b358c700"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.10.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "502c84e706769aa8bc205cebfc4576a228f04f7770be7c1ba9cec2dfd395c058"
    sha256 cellar: :any_skip_relocation, monterey:      "af59b1c0166b924e767162e0885421e6f95004eec13d5b5254ef1843278748f0"
    sha256 cellar: :any_skip_relocation, big_sur:       "eb162f9e1cf0126b85b18b2fb5b83a05c6409ee6601b50bf589aec0e760e5d8a"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
