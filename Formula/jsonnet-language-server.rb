class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.12.1.tar.gz"
  sha256 "66d50946bf34bbe10850f31bfa72ed998a1287767b85e68100d5909ccf29d4c9"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.12.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "be80518c979800e84f0a4711d2ffc1b4d270c08cf3b5bb6f99ca09ab9fbcf801"
    sha256 cellar: :any_skip_relocation, monterey:      "8573e92027ecc1a394fa182f5f6e056eceb2e43676f81f27ce0a7812071ceffb"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "13244cf490dbca94e41fe89d4d0a3178c3356db6eb37132a00208a1e8b83c9db"
  end

  depends_on "go" => [:build, :test]

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
