cask "swift-shift" do
  version "1.4.0"
  sha256 "4937b01b5df0035595b0b0066eb7fd28f1db41ff861dc085c23baf35f9d8bcc3"

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
