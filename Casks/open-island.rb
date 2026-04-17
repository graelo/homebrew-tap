cask "open-island" do
  version "1.0.23"
  sha256 "8124ba7487183460a4a7fe3f7543d0c39e6770f601600afa3034e42f21be173c"

  url "https://github.com/Octane0411/open-vibe-island/releases/download/v#{version}/Open.Island.dmg"
  name "Open Island"
  desc "Open-source dynamic island for AI coding agents"
  homepage "https://github.com/Octane0411/open-vibe-island"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Open Island.app"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: "~/Library/Application Support/Open Island"
end
