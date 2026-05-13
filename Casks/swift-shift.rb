cask "swift-shift" do
  version "1.1.1"
  sha256 "b116d5ccb31df4c4fcf51bf5a850fcb341026a1e5ec0dd0ed427fcac022dd8a7"

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
