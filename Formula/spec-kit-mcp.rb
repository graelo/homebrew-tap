class SpecKitMcp < Formula
  desc "MCP server enabling AI assistants to use GitHub's spec-kit methodology"
  homepage "https://github.com/lsendel/spec-kit-mcp"
  url "https://github.com/lsendel/spec-kit-mcp/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cd48911a52905e6d46b399b60bf46297a7530d6eb237cd4b797e3138cb7b9448"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test spec-kit-mcp`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "true"
  end
end
