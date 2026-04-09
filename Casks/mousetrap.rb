cask "mousetrap" do
  version "0.3.0"
  sha256 "df63de04a5a1718225ab2077d4c46dc57b9e118ec66157d0e1fb07be3f9f38f2"

  url "https://github.com/pablopunk/mousetrap/releases/download/v#{version}/Mousetrap.zip"
  name "Mousetrap"
  desc "Keyboard-driven mouse control for macOS"
  homepage "https://github.com/pablopunk/mousetrap"

  app "Mousetrap.app"

  zap trash: [
    "~/Library/Preferences/com.pablopunk.mousetrap.plist",
  ]
end
