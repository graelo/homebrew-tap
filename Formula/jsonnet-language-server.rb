class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.17.0.tar.gz"
  sha256 "7d51fbd633475f449772c95e410ffb498df5e4e2102c7ac49072a76f38a5b98b"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.16.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a26358e65e8e5ee18d55b3eb5cb4709f683f41b8e399a937c7b420ffa65f9120"
    sha256 cellar: :any_skip_relocation, ventura:      "6320a37a82b1b461bf4ff1c3dd6bf5245e159d5baae34f1063ba872c296484cd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d4a7d313d4fe4ca9ec6272e92a4e7a81aa0f210f200bab10a89582473c33df02"
  end

  depends_on "go" => [:build, :test]

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
