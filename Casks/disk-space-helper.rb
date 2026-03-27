cask "disk-space-helper" do
  version "1.0.0"
  sha256 "37b1a2f62b9d45c605b610c679774ffa811dbfc1abdcdb4acd84cc6f4867e317"

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
