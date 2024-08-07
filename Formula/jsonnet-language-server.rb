class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.14.0.tar.gz"
  sha256 "b24835338786c97e8be3609e98cb7e8af70d5ed02da23d144bc1cfbab15f6abd"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.13.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "38c78b66413f5381913739a2241c89d6f581f41a64f7272adca30d4d5ddac53a"
    sha256 cellar: :any_skip_relocation, monterey:      "aabde20bb4b0fb8d83b75524d3418cbe1faf4f8913f95a1053393e4b20cc86ff"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "435188cfab619eec0fabd618a689f3c903ac0825fdde3be442bf5c1b6c8ebcab"
  end

  depends_on "go" => [:build, :test]

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
