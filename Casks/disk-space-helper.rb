cask "disk-space-helper" do
  version "2.0.0"
  sha256 "ce5dde0b54610f5e0e28ec7e4d02ee04695f3b39f2cd514c18cb67fe2c42a25c"

  url "https://github.com/vapor-pawelw/disk-space-helper/releases/download/v2.0.0/DiskSpaceHelper.dmg"
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
