cask "mousetrap" do
  version "0.1.6"
  sha256 "0dff34596671f3b3f5c3e1785338f206a78d5155f2e101728733f38dfb15d396"

  url "https://github.com/pablopunk/mousetrap/releases/download/v#{version}/Mousetrap.zip"
  name "Mousetrap"
  desc "Keyboard-driven mouse control for macOS"
  homepage "https://github.com/pablopunk/mousetrap"

  app "Mousetrap.app"

  zap trash: [
    "~/Library/Preferences/com.pablopunk.mousetrap.plist",
  ]
end
