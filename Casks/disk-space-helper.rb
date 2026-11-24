cask "disk-space-helper" do
  version "2.1.0"
  sha256 "ae285ec2188a772ef2bd5b2972aed0936a0f2a10377640e6df5f9f94a1f9697c"

  url "https://github.com/vapor-pawelw/disk-space-helper/releases/download/v2.1.0/DiskSpaceHelper.dmg"
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
