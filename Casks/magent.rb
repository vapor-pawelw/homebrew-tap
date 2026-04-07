cask "magent" do
  version "1.5.3"
  sha256 "2a7eecd7666f6667c84489e7158e91585aec35a46326d611c4acca540a2e1d6b"

  url "https://github.com/vapor-pawelw/mAgent/releases/download/v1.5.3/Magent.dmg"
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
