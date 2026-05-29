cask "magent" do
  version "1.6.4"
  sha256 "bb788b76815afdcf680514aea9f91405a513b66c6871651aca908ed954a0d63d"

  url "https://github.com/vapor-pawelw/mAgent/releases/download/v1.6.4/Magent.dmg"
  name "mAgent"
  desc "Native macOS app for managing coding agents as parallel git worktree sessions"
  homepage "https://github.com/vapor-pawelw/mAgent"

  app "Magent.app"

  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/Magent.app"]
  end

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
