cask "magent" do
  version "1.5.2"
  sha256 "51843beed5e1c0addd9af24a0191e5924706051dd259caf04414c77f63c012f9"

  url "https://github.com/vapor-pawelw/mAgent/releases/download/v1.5.2/Magent.dmg"
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
