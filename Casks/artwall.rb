cask "artwall" do
  version "0.2.11"
  sha256 "9ed2b6609e1529de6f04d4cf826a650f2994f022867e7db192b5357cf55acc66"

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
