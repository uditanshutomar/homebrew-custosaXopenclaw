cask "custosa" do
  version "1.0.1"
  sha256 "3d1994a447871d68874e41e215587d4f527d4801b2200345f6401ecdd213f7e2"
  revision 1

  url "https://github.com/uditanshutomar/CustosaXopenclaw/releases/download/#{version}/CustosaXopenclaw.zip"
  name "Custosa"
  desc "Prompt Injection Protection for OpenClaw/Moltbot"
  homepage "https://github.com/custosa/custosa"

  depends_on macos: ">= :ventura"

  app "Custosa.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Custosa.app"]
  end

  uninstall launchctl: "com.custosa.proxy"
  zap trash: [
    "~/Library/LaunchAgents/com.custosa.proxy.plist",
    "~/.custosa",
  ]
end
