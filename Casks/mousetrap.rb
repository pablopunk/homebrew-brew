cask "mousetrap" do
  version "0.1.0"
  sha256 "61e7540d247c4e30040f3d5547e1bf62e8fd573542d38bf2319e6e00d2247e13"

  url "https://github.com/pablopunk/mousetrap/releases/download/v#{version}/Mousetrap.zip"
  name "Mousetrap"
  desc "Keyboard-driven mouse control for macOS"
  homepage "https://github.com/pablopunk/mousetrap"

  app "Mousetrap.app"

  zap trash: [
    "~/Library/Preferences/com.pablopunk.mousetrap.plist",
  ]
end
