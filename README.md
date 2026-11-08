# homebrew-tap

Homebrew tap for Rinnegan, a local-first macOS menu-bar dashboard.

```sh
brew tap 0xrnp/tap
brew trust 0xrnp/tap
brew install --cask 0xrnp/tap/rinnegan
```

Recent Homebrew versions refuse casks from a tap until you trust it, hence the
`brew trust` step. Apple silicon, macOS 27 or later.

The app is not notarized yet; the cask removes the quarantine flag on install.
