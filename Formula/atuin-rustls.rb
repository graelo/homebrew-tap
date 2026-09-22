class AtuinRustls < Formula
  desc "Improved shell history for zsh, bash, fish and nushell (rustls TLS backend)"
  homepage "https://atuin.sh/"
  url "https://github.com/atuinsh/atuin/releases/download/v18.23.0/source.tar.gz"
  sha256 "64b4b9b0f84ef34bcfa88e992d38cc0b95d3cf1f6d470bb695d3ef0231445b26"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/atuin-rustls-18.23.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2cbdce3bac8b3b05284167af52011dedf8057aeb79100ee6261a32c658887a31"
  end

  depends_on "pkgconf" => :build
  depends_on "protobuf" => :build
  depends_on "rust" => :build
  depends_on :macos

  conflicts_with "atuin", because: "both install an `atuin` binary and completions"

  # macOS's native-tls backend (Apple Security.framework / SSLContext) has no
  # TLS 1.3 support at all, so it silently falls back to 1.2 or fails outright
  # against TLS-1.3-only servers. Switch reqwest to rustls, which has no such
  # cap on any platform and still verifies against the system root store via
  # rustls-platform-verifier.
  patch :DATA

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/atuin")

    generate_completions_from_executable(bin/"atuin", "gen-completion", "--shell",
                                                      shells: [:bash, :zsh, :fish, :pwsh])
  end

  service do
    run [opt_bin/"atuin", "daemon", "start"]
    keep_alive true
    log_path var/"log/atuin.log"
    error_log_path var/"log/atuin.log"
  end

  test do
    ENV["ATUIN_SESSION"] = "random"
    assert_match "autoload -U add-zsh-hook", shell_output("#{bin}/atuin init zsh")
    assert shell_output("#{bin}/atuin history list").blank?
  end
end

__END__
diff --git a/Cargo.toml b/Cargo.toml
index 0000000..0000000 100644
--- a/Cargo.toml
+++ b/Cargo.toml
@@ -116,7 +116,7 @@ regex = "1.10.5"
 reqwest = {
     version = "0.13",
     default-features = false,
-    features = ["json", "native-tls", "stream", "gzip", "zstd"],
+    features = ["json", "rustls", "stream", "gzip", "zstd"],
 }
 reqwest-middleware = "0.5"
 rmcp = { version = "2.1.0", default-features = false, features = ["server", "transport-io"] }
