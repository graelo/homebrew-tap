class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "639f56e6160555d837f8816860c1007f5b4ed4227be1ee5612e56a711b26426a"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.12.0"
    sha256 cellar: :any_skip_relocation, monterey:     "8573e92027ecc1a394fa182f5f6e056eceb2e43676f81f27ce0a7812071ceffb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "13244cf490dbca94e41fe89d4d0a3178c3356db6eb37132a00208a1e8b83c9db"
  end

  depends_on "go" => [:build, :test]

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
