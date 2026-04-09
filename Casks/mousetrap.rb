cask "mousetrap" do
  version "0.3.2"
  sha256 "3aed03082143499ea53342ebcd4e777c8e6ef298b39a13b41d0b3a398db79ec4"

  url "https://github.com/pablopunk/mousetrap/releases/download/v#{version}/Mousetrap.zip"
  name "Mousetrap"
  desc "Keyboard-driven mouse control for macOS"
  homepage "https://github.com/pablopunk/mousetrap"

  app "Mousetrap.app"

  zap trash: [
    "~/Library/Preferences/com.pablopunk.mousetrap.plist",
  ]
end
