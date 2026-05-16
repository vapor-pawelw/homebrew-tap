cask "magent" do
  version "1.6.2"
  sha256 "0ddd4a9fc0f637ed2e879f9fc6ace33d5f1bab8efaf8f420e650c17c161b20e6"

  url "https://github.com/vapor-pawelw/mAgent/releases/download/v1.6.2/Magent.dmg"
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
