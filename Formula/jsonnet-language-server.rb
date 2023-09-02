class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.13.1.tar.gz"
  sha256 "00341c5bd1ea8b2eb2be61cc26cdba5a6c6b678c30d9b3f55a625e8db40d1bfa"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.13.1"
    sha256 cellar: :any_skip_relocation, monterey:     "aabde20bb4b0fb8d83b75524d3418cbe1faf4f8913f95a1053393e4b20cc86ff"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "435188cfab619eec0fabd618a689f3c903ac0825fdde3be442bf5c1b6c8ebcab"
  end

  depends_on "go" => [:build, :test]

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
