class GcodeLanguageServer < Formula
  desc "LSP server for GCode"
  homepage "https://github.com/graelo/gcode-language-server"
  url "https://github.com/graelo/gcode-language-server/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "1ff16679d528a2f2b057d071cdc0899dfd8f1a8aba5e03abdf6c3ded8d4fc723"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/gcode-language-server-0.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bb6cd882ef5c6a3cf8f8997557168678154a3dc23413c53b29bbfe11bf491270"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "b6e742a54c696ff2058962c2f48ed44f953855a2b0a2fd746f11a1cb74786e00"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1d477383397f1c56733341690db7d052b08082e384284b10ad4c4fe852c92fbf"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
