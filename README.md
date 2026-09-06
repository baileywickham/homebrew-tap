# homebrew-tap

Homebrew tap for [baileywickham](https://github.com/baileywickham)'s Mac apps.

## Usage

```bash
brew tap baileywickham/tap
brew install --cask artwall
brew install --cask beads
brew install --cask skylight
```

Everything at once on a new machine:

```bash
brew tap baileywickham/tap
brew bundle --file="$(brew --repo baileywickham/tap)/Brewfile"
```

Update: `brew upgrade --greedy` (ArtWall and Beads also self-update via Sparkle).
Remove: `brew uninstall --zap <cask>`.

## Casks

| Cask | App | Source |
|---|---|---|
| [artwall](Casks/artwall.rb) | Menu bar app that sets art wallpapers from Artpaper packs | [ArtWall](https://github.com/baileywickham/ArtWall) |
| [beads](Casks/beads.rb) | Native macOS UI for the beads issue tracker | [beads-ui](https://github.com/baileywickham/beads-ui) |
| [skylight](Casks/skylight.rb) | Local computer-use daemon (AX trees, screenshots, UI actuation) | [skylight](https://github.com/baileywickham/skylight) |

## How releases reach the tap

Each app repo runs `./release.sh patch` to push a `v*` tag. Its release
workflow builds, signs, notarizes, and publishes a GitHub release, then calls
the reusable [`bump-cask`](.github/workflows/bump-cask.yml) workflow here,
which rewrites the cask's `version` and `sha256` and pushes. Nothing in this
repo is edited by hand except when adding a new cask.
