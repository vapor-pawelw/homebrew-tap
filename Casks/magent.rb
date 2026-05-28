cask "magent" do
  version "1.6.3"
  sha256 "13f90ad14a9ccbf4cafa0d434d4f2cc3e878bdac40b14562be7da44e6c54e1f0"

  url "https://github.com/vapor-pawelw/mAgent/releases/download/v1.6.3/Magent.dmg"
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
