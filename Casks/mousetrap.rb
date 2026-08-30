cask "mousetrap" do
  version "0.4.0"
  sha256 "9b5614c93b28df9521a6f9be16204785ca284e2c9f83a90c404717493ff05852"

  url "https://github.com/pablopunk/mousetrap/releases/download/v#{version}/Mousetrap.zip"
  name "Mousetrap"
  desc "Keyboard-driven mouse control for macOS"
  homepage "https://github.com/pablopunk/mousetrap"

  app "Mousetrap.app"

  zap trash: [
    "~/Library/Preferences/com.pablopunk.mousetrap.plist",
  ]
end
