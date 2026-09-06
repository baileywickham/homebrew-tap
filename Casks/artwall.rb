cask "artwall" do
  version "0.2.12"
  sha256 "bfa757435f934a243ea5e3ef0b41fb60636643f86736aae5c194a1c6671eb988"

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
