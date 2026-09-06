# version/sha256 are rewritten by the bump-cask workflow on every apple-mcp
# release; 0.0.0 means no release has been published yet.
cask "apple-mcp" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/baileywickham/apple-mcp/releases/download/v#{version}/AppleMCP-#{version}-macOS.dmg"
  name "Apple MCP"
  desc "MCP server for Apple Reminders, Calendar and Notes (stdio + streamable HTTP)"
  homepage "https://github.com/baileywickham/apple-mcp"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Apple MCP.app"
  binary "#{appdir}/Apple MCP.app/Contents/MacOS/apple-mcp"

  zap trash: "~/Library/Preferences/com.baileywickham.apple-mcp.plist"

  caveats <<~EOS
    Point your MCP client at the launcher, e.g. for Claude Code:
      claude mcp add --scope user apple -- apple-mcp
    macOS asks for Reminders, Calendars, and Notes automation access on first
    use; the grants attach to Apple MCP.app and survive upgrades.
    Streamable HTTP for remote agents:
      APPLE_MCP_TOKEN=... apple-mcp --http --host 0.0.0.0 --port 8000
  EOS
end
