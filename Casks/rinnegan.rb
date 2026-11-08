cask "rinnegan" do
  version "0.1.0"
  sha256 "da1d49949fc30c955d754751769336c6d785ea945cf2e80db2114f9ddabd7ed5"

  url "https://github.com/0xrnp/homebrew-tap/releases/download/v#{version}/Rinnegan-#{version}.zip"
  name "Rinnegan"
  desc "Local-first menu-bar dashboard for developer tools"
  homepage "https://github.com/0xrnp/homebrew-tap"

  depends_on arch: :arm64

  app "Rinnegan.app"

  # The app is not notarized yet, so macOS would block its first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Rinnegan.app"]
  end

  zap trash: "~/Library/Preferences/app.rnp.Rinnegan.plist"

  caveats <<~EOS
    Rinnegan is not notarized. This cask removes the quarantine flag so it opens
    without a Gatekeeper warning. Only install it if you trust the author.
  EOS
end
