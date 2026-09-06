# version/sha256 are rewritten by the bump-cask workflow on every skylight
# release; 0.0.0 means no release has been published yet.
cask "skylight" do
  version "0.3.0"
  sha256 "776b1a9217c35b504aa3a13101122d8e30bd51cf97c6f5f3dc32de2c0cbd215b"

  url "https://github.com/baileywickham/skylight/releases/download/v#{version}/SkylightService-#{version}-macOS.dmg"
  name "Skylight"
  desc "Local computer-use daemon: AX trees, screenshots, and UI actuation for native apps"
  homepage "https://github.com/baileywickham/skylight"

  depends_on macos: :sonoma

  app "SkylightService.app"
  binary "#{appdir}/SkylightService.app/Contents/MacOS/skylight"
  binary "#{appdir}/SkylightService.app/Contents/MacOS/skylight-run"

  postflight do
    # Registers the bundled LaunchAgent via SMAppService and starts the daemon.
    system_command "#{appdir}/SkylightService.app/Contents/MacOS/skylight",
                   args: ["register"]
  end

  uninstall launchctl: "com.skylight.SkylightService"

  zap trash: [
    "~/Library/Application Support/skylight",
    "~/Library/Logs/skylight",
  ]

  caveats <<~EOS
    One-time: grant SkylightService its permissions in
    System Settings > Privacy & Security:
      - Accessibility     -> add /Applications/SkylightService.app
      - Screen Recording  -> add /Applications/SkylightService.app
    then restart it:
      skylight start

    Check status with `skylight doctor`; manage the actuation allowlist with
    `skylight approve "<App>"`.
  EOS
end
