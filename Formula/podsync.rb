class Podsync < Formula
  desc "Podcasts feed generator"
  homepage "https://github.com/graelo/podsync"
  url "https://github.com/graelo/podsync/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "33a29bd444d4e7e70ee17d3783d73964adea0ed57bf422239da5b3dc32804e6a"
  license "MIT"

  depends_on "rust" => [:build, :test] unless system "command", "--query", "cargo"

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"podsync", "generate-completion")
  end

  test do
    assert_match "#compdef podsync", shell_output("#{bin}/podsync generate-completion zsh")
  end
end
