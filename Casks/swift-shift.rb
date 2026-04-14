cask "swift-shift" do
  version "1.0.3"
  sha256 "1b2622ca339abcd7bac548951e74ae5ade488aa084bef3a0fa7f05a83c93a89f"

  url "https://github.com/pablopunk/SwiftShift/releases/download/#{version}/SwiftShift.zip"
  name "Swift Shift"
  desc "Sweet window management for macOS"
  homepage "https://swiftshift.app"

  app "Swift Shift.app"

  zap trash: [
    "/Applications/SwiftShift.app",
    "~/Library/Application Scripts/com.pablopunk.SwiftShift",
    "~/Library/Containers/com.pablopunk.SwiftShift",
    "~/Library/HTTPStorages/com.pablopunk.SwiftShift",
    "~/Library/HTTPStorages/com.pablopunk.SwiftShift.binarycookies",
    "~/Library/Preferences/com.pablopunk.SwiftShift.plist",
  ]
end
