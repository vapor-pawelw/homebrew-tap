cask "magent" do
  version "1.5.0"
  sha256 "7cf27ecf4b621b4947e57aafbd8d3c802f1f82003811388deb9e891269695c77"

  url "https://github.com/vapor-pawelw/mAgent/releases/download/v1.5.0/Magent.dmg"
  name "mAgent"
  desc "Native macOS app for managing coding agents as parallel git worktree sessions"
  homepage "https://github.com/vapor-pawelw/mAgent"

  app "Magent.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Magent.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Magent",
    "~/Library/Preferences/com.magent.app.plist",
  ]
end
