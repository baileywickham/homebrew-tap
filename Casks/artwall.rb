cask "artwall" do
  version "0.2.10"
  sha256 "9ad35a9e4c76634ed8f0bb48dd2b940bc1891d59a246ea4eeb2680dc2ddda708"

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
