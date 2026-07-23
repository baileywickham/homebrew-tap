cask "artwall" do
  version "0.2.9"
  sha256 "577a0edcafafa3128cf55d7ffb10b859461beb3e993ccbd263455b85d50e82a2"

  url "https://github.com/baileywickham/ArtWall/releases/download/v#{version}/ArtWall-#{version}-macOS.dmg"
  name "ArtWall"
  desc "Menu bar app that sets art wallpapers from Artpaper packs"
  homepage "https://github.com/baileywickham/ArtWall"

  auto_updates true

  app "ArtWall.app"

  zap trash: [
    "~/Library/LaunchAgents/com.baileywickham.ArtWall.plist",
    "~/Library/Application Support/ArtWall",
    "~/Library/Preferences/com.baileywickham.ArtWall.plist",
  ]
end
