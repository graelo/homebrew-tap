class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet (https://jsonnet.org)"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "2e9a92214d8e0695dda95c063e329415e8f47eff8fe2bcfe457b25bf48dbdc4d"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/jsonnet-language-server-0.8.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "4135e59c9c4ce8bc0c96d39afa64c1fe8c570d98ca611df1ad3b34e411130411"
    sha256 cellar: :any_skip_relocation, monterey:      "54265dcf7358741230d741e40262c67892ad9efe7ee6d6ea9c11522e3966a7b0"
    sha256 cellar: :any_skip_relocation, big_sur:       "fd26bd808ae606310130f33583b162bb0bcbebac864644cf12ac19e6e2c8fb23"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8f4bad0799fb111e6d92ac1e1799e72fdd93529da08c26233af578d6494a1ca4"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "jsonnet-language-server", shell_output("#{bin}/jsonnet-language-server --version")
  end
end
