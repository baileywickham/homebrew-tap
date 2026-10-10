cask "artwall" do
  version "0.2.14"
  sha256 "eec4b43ef06d7c02cc88c1f49a295334e01a8234e5903691862fb3739577227d"

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
