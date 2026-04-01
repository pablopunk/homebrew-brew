cask "mousetrap" do
  version "0.1.2"
  sha256 "a7f7248fe36288695cd91ff8d219be14db81c91285d3106550045c8d58f96287"

  url "https://github.com/pablopunk/mousetrap/releases/download/v#{version}/Mousetrap.zip"
  name "Mousetrap"
  desc "Keyboard-driven mouse control for macOS"
  homepage "https://github.com/pablopunk/mousetrap"

  app "Mousetrap.app"

  zap trash: [
    "~/Library/Preferences/com.pablopunk.mousetrap.plist",
  ]
end
