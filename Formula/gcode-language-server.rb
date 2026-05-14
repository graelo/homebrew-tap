class GcodeLanguageServer < Formula
  desc "LSP server for GCode"
  homepage "https://github.com/graelo/gcode-language-server"
  url "https://github.com/graelo/gcode-language-server/archive/refs/tags/v0.0.0.tar.gz"
  sha256 "c7794eac6f66737fcc13f0f18d14bbbaa4696b12fd988a7f890b9e649b561102"
  license any_of: ["Apache-2.0", "MIT"]

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
