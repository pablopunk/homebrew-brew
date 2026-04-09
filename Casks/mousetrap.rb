cask "mousetrap" do
  version "0.3.1"
  sha256 "fde4e69a453fdff73d455da56dd722bc6a35e5216c618e7bbb99a1c76a1cc16d"

  url "https://github.com/pablopunk/mousetrap/releases/download/v#{version}/Mousetrap.zip"
  name "Mousetrap"
  desc "Keyboard-driven mouse control for macOS"
  homepage "https://github.com/pablopunk/mousetrap"

  app "Mousetrap.app"

  zap trash: [
    "~/Library/Preferences/com.pablopunk.mousetrap.plist",
  ]
end
