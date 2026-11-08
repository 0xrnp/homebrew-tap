cask "rinnegan" do
  version "0.1.2"
  sha256 "daba5a6a3a6599512519517f25918b6b0dee50a20701c6425959d3c643f9ed79"

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
