cask "disk-space-helper" do
  version "2.1.1"
  sha256 "78ab3e11b3cef7ac70622d31eb3088f0f42f4dc41158dfa8457548bbafac059c"

  url "https://github.com/vapor-pawelw/disk-space-helper/releases/download/v2.1.1/DiskSpaceHelper.dmg"
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
