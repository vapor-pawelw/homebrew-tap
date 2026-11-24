cask "disk-space-helper" do
  version "2.1.2"
  sha256 "ffe9c63904e2002b5c288e38e625c3071c06984e8d6d04d8466ea198791c01e2"

  url "https://github.com/vapor-pawelw/disk-space-helper/releases/download/v2.1.2/DiskSpaceHelper.dmg"
  name "Disk Space Helper"
  desc "Lightweight macOS menu bar utility that monitors disk space"
  homepage "https://github.com/vapor-pawelw/disk-space-helper"

  depends_on macos: ">= :sonoma"

  app "DiskSpaceHelper.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/DiskSpaceHelper.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.vaporpw.DiskSpaceHelper.plist",
  ]
end
