cask "mousetrap" do
  version "0.1.3"
  sha256 "7c17d9f330147a6a42f627565029b16f5d818c7686a5e0e91589ddf14b9c1863"

  url "https://github.com/pablopunk/mousetrap/releases/download/v#{version}/Mousetrap.zip"
  name "Mousetrap"
  desc "Keyboard-driven mouse control for macOS"
  homepage "https://github.com/pablopunk/mousetrap"

  app "Mousetrap.app"

  zap trash: [
    "~/Library/Preferences/com.pablopunk.mousetrap.plist",
  ]
end
