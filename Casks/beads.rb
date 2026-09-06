cask "beads" do
  version "0.2.27"
  sha256 "ba419c147f38c0701d978f06831dba4bac511b6e79fedbeed715957db0d778ee"

  url "https://github.com/baileywickham/beads-ui/releases/download/v#{version}/Beads-#{version}-macOS.dmg"
  name "Beads"
  desc "Native UI for the beads issue tracker"
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
