cask "rinnegan" do
  version "0.1.1"
  sha256 "6b327d5842a582d16983120bdf70236c269576904a376a63702acb14d10803f3"

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
