cask "mergetether" do
  version "2.0.0"
  sha256 "5e2c71cc8bf087767e46bbc644539a5a3585d2735e782f6e1ca590f9bc06f741"

  url "https://github.com/vapor-pawelw/merge-tether/releases/download/v2.0.0/MergeTether.dmg"
  name "MergeTether"
  desc "Menu-bar app that surfaces your GitLab to-do inbox via the glab CLI"
  homepage "https://github.com/vapor-pawelw/merge-tether"

  auto_updates true
  depends_on formula: "glab"
  depends_on macos: ">= :sonoma"

  app "MergeTether.app"

  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/MergeTether.app"]
  end

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/MergeTether.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Caches/com.vaporpw.MergeTether",
    "~/Library/Preferences/com.vaporpw.MergeTether.plist",
  ]
end
