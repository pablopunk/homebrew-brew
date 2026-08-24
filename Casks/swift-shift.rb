cask "swift-shift" do
  version "1.4.1"
  sha256 "858b9537d7a6277dcdb160a0e7ba218a80e69db764ff1a36bf29cc010130ed92"

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
