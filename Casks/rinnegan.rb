cask "rinnegan" do
  version "0.1.5"
  sha256 "7c1a5fe6707c28b047f49e787779c99acdc152d1fbf3819af8653bb205f7eccb"

  url "https://github.com/0xrnp/homebrew-tap/releases/download/v#{version}/Rinnegan-#{version}.zip"
  name "Rinnegan"
  desc "Local-first menu-bar dashboard for developer tools"
  homepage "https://github.com/0xrnp/homebrew-tap"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Rinnegan.app"

  # The app is not notarized yet, so macOS would block its first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Rinnegan.app"]
  end

  zap trash: "~/Library/Preferences/app.rnp.Rinnegan.plist"

  caveats <<~EOS
    Rinnegan is not notarized. This cask removes the quarantine flag so it opens
    without a Gatekeeper warning. Only install it if you trust the author.
  EOS
end
