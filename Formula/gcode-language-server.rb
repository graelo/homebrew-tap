class GcodeLanguageServer < Formula
  desc "LSP server for GCode"
  homepage "https://github.com/graelo/gcode-language-server"
  url "https://github.com/graelo/gcode-language-server/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "1ff16679d528a2f2b057d071cdc0899dfd8f1a8aba5e03abdf6c3ded8d4fc723"
  license any_of: ["Apache-2.0", "MIT"]

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
