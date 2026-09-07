# version/sha256 are rewritten by the bump-cask workflow on every skylight
# release; 0.0.0 means no release has been published yet.
cask "skylight" do
  version "0.3.1"
  sha256 "984079278d853797bf7336b913700e61fd3703f622792e2ba1790137e6c7d7c1"

  url "https://github.com/baileywickham/skylight/releases/download/v#{version}/SkylightService-#{version}-macOS.dmg"
  name "Skylight"
  desc "Local computer-use daemon: AX trees, screenshots, and UI actuation"
  homepage "https://github.com/baileywickham/skylight"

  depends_on macos: :sonoma

  app "SkylightService.app"
  binary "#{appdir}/SkylightService.app/Contents/MacOS/skylight"
  binary "#{appdir}/SkylightService.app/Contents/Resources/bin/skylight-run"

  # Registers the bundled LaunchAgent via SMAppService and starts the daemon.
  # Idempotent; rerun by hand as `skylight register` if it ever fails here.
  postflight_steps do
    run "SkylightService.app/Contents/MacOS/skylight", base: :appdir, args: ["register"],
        print_stdout: true, must_succeed: false
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
