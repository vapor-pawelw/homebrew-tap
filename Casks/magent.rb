cask "magent" do
  version "1.5.1"
  sha256 "5b29aff06af034c875afbc9bf38c8a67b264cf0d79037bce3e74375680ce77e3"

  url "https://github.com/vapor-pawelw/mAgent/releases/download/v1.5.1/Magent.dmg"
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
