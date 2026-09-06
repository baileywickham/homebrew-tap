cask "beads" do
  version "0.2.26"
  sha256 "fd5082f536092ed3ca08a5b2e58afabfbba6898cadd2867292b4081636a70575"

  url "https://github.com/baileywickham/beads-ui/releases/download/v#{version}/Beads-#{version}-macOS.dmg"
  name "Beads"
  desc "Native macOS UI for the beads issue tracker"
  homepage "https://github.com/baileywickham/beads-ui"

  auto_updates true
  depends_on :macos

  app "Beads.app"

  zap trash: [
    "~/Library/Application Support/Beads",
    "~/Library/Caches/com.beads.app",
    "~/Library/Preferences/com.beads.app.plist",
  ]
end
