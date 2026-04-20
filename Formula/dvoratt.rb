class Dvoratt < Formula
  desc "Dvorak Typing Practice Terminal App"
  homepage "https://github.com/graelo/dvoratt"
  url "https://github.com/graelo/dvoratt/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "4759dfa906b19ba18ec9e038a11a2e208c35f81fb38a9a0417adaa4259a87870"
  license "MIT"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/dvoratt-0.1.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "73753b1c9f7e7b0199754f96baf5af0614573de7b7264776f0b81bbcae638e52"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "863c6b2ef3238468fd9b0e40b11a542cd30229ffb72b01ce833b62c7340a1d94"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "899e97b482f8e7c42ffa895be7c89bc84b1ab537d304268ac5461dba2b798e93"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end
end
