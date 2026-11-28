cask "mergetether" do
  version "2.0.1"
  sha256 "6abb32505feb439e6eeaa2ea1acf1fafc10309d5ffee995f9a0dcc9a5c208347"

  url "https://github.com/vapor-pawelw/merge-tether/releases/download/v2.0.1/MergeTether.dmg"
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
