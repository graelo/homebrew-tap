class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.16.0.tar.gz"
  sha256 "616fdfc5a5c9447762c1c1bb1522053d923d0415a68937ec48385eca5d49c2fa"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.15.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "0a24e16a2a0d80a325c3ba3a71dc3e77c966431a18cc44f513bac5ff05e5c7bf"
    sha256 cellar: :any_skip_relocation, ventura:      "019fcb5c45b68ba58b921376707a2be0bc4f4c1bfcd2f27d26eca265bd198e17"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aa330e4beff7168f978387edc1f345806c85777b8949a50b20a279f9c2338b1e"
  end

  depends_on "go" => [:build, :test]

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
