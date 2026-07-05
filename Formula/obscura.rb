class Obscura < Formula
  desc "Open-source headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"
  url "https://github.com/h4ckf0r0day/obscura/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "a74a357388a3fc61e9c992b93907e9358e2bfb6fbaba567cf25eaa0f2b646894"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/obscura-cli")
  end

  test do
    assert_match "obscura #{version}", shell_output("#{bin}/obscura --version")
  end
end
