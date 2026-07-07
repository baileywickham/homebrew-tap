cask "artwall" do
  version "0.2.6"
  sha256 "3c5a0693a5d7e063b444b2fd36dcb46b1e8f6ee76820d841b13e23eb0dcec1cf"

  url "https://github.com/baileywickham/ArtWall/releases/download/v#{version}/ArtWall-#{version}-macOS.dmg"
  name "ArtWall"
  desc "Menu bar app that sets art wallpapers from Artpaper packs"
  homepage "https://github.com/baileywickham/ArtWall"

  app "ArtWall.app"

  zap trash: [
    "~/Library/LaunchAgents/com.baileywickham.ArtWall.plist",
    "~/Library/Application Support/ArtWall",
    "~/Library/Preferences/com.baileywickham.ArtWall.plist",
  ]
end
