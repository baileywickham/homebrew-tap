cask "artwall" do
  version "0.2.13"
  sha256 "6bd5d365f5585764f065e8f06095ba5e4fbffe3b830530bc3e9bc77dbe77c0c9"

  url "https://github.com/baileywickham/ArtWall/releases/download/v#{version}/ArtWall-#{version}-macOS.dmg"
  name "ArtWall"
  desc "Menu bar app that sets art wallpapers from Artpaper packs"
  homepage "https://github.com/baileywickham/ArtWall"

  auto_updates true
  depends_on macos: :sonoma

  app "ArtWall.app"

  zap trash: [
    "~/Library/Application Support/ArtWall",
    "~/Library/LaunchAgents/com.baileywickham.ArtWall.plist",
    "~/Library/Preferences/com.baileywickham.ArtWall.plist",
  ]
end
