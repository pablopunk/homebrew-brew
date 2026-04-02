cask "mousetrap" do
  version "0.2.0"
  sha256 "eb74d3bf6de9aa7c6b6db7a2b7680030ff78fab138a5b49ef976e8395e5d1ad6"

  url "https://github.com/pablopunk/mousetrap/releases/download/v#{version}/Mousetrap.zip"
  name "Mousetrap"
  desc "Keyboard-driven mouse control for macOS"
  homepage "https://github.com/pablopunk/mousetrap"

  app "Mousetrap.app"

  zap trash: [
    "~/Library/Preferences/com.pablopunk.mousetrap.plist",
  ]
end
