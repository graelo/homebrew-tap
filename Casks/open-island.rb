cask "open-island" do
  version "1.3.3"
  sha256 "e2661ed4b15930322b85fab788f8c07836f960b6beced9efe2065c8052f07e90"

  url "https://github.com/Octane0411/open-vibe-island/releases/download/v#{version}/Open.Island.dmg"
  name "Open Island"
  desc "Open-source dynamic island for AI coding agents"
  homepage "https://github.com/Octane0411/open-vibe-island"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Open Island.app"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: "~/Library/Application Support/Open Island"
end
