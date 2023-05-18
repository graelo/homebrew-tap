class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.12.1.tar.gz"
  sha256 "66d50946bf34bbe10850f31bfa72ed998a1287767b85e68100d5909ccf29d4c9"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.12.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "bccd80725ad3a216a6e78d1af51c0906c6c5a7e9f822cf614cd1ffa242818d7e"
    sha256 cellar: :any_skip_relocation, monterey:      "f5f6b097229656a0bb8cd2b5570c06736794c0853f125e3e7c40deaf58e3aa60"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a8e5d3d90ff07edcffbce1fb3c9de69219fd3ee2bd8aac3599a71c06fc5fedfc"
  end

  depends_on "go" => [:build, :test]

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
