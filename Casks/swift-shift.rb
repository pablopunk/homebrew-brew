cask "swift-shift" do
  version "1.2.0"
  sha256 "b2767eb47dc15f33c4f80540f3faa299804827beffcc2b00773567132e28044a"

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
