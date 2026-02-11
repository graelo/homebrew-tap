class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.17.0.tar.gz"
  sha256 "7d51fbd633475f449772c95e410ffb498df5e4e2102c7ac49072a76f38a5b98b"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.17.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a6ed42bd0315b92de507b54543637a74614a64cf02208e4e182a7fa2e544adb1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b148164841a8dac86a24d5a85c0a5cf768574a5289ee6dae5e0c2dc3a9f5a253"
  end

  depends_on "go" => [:build, :test]

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
