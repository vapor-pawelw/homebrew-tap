cask "disk-space-helper" do
  version "1.0.1"
  sha256 "85677cffa0759cf58199524bff83982067e41a5a71576a76386acc6ff9776f2c"

  url "https://github.com/vapor-pawelw/disk-space-helper/releases/download/v#{version}/DiskSpaceHelper-#{version}.dmg"
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
    "~/Library/Preferences/com.pawelw.DiskSpaceHelper.plist",
  ]
end
