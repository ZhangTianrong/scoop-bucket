# Yet another personal [bucket](https://github.com/lukesampson/scoop/wiki/Buckets) for [Scoop](https://github.com/lukesampson/scoop)

## Featured Apps

| Manifest                                                     | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [aida64-keygen](https://github.com/LeagueRaINi/Aida64-Keys)  | A keygen for [extra/aida64-extreme](https://github.com/ScoopInstaller/Extras/blob/master/bucket/aida64extreme.json). No prebuilt binary available, so it requires properly setuped [rustup](https://rustup.rs/) to compile. |
| [chatbox](https://github.com/Bin-Huang/chatbox)              | A [Tauri](https://tauri.app/) app for using OpenAI APIs for GPT-3.5/-4. The shortcut is renamed to ChatGPT and a custom icon will be used if [ImageMagick](https://imagemagick.org/) is available. |
| [curl](https://curl.se/)                                     | Modified from [main/curl](https://github.com/ScoopInstaller/Main/blob/master/bucket/curl.json) to interactively prompt for user actions before overwrite if local `curl-ca-bundle.crt` is modified. |
| [foldertimeupdate](https://www.nirsoft.net/utils/folder_time_update.html), [wifiinfoview](https://www.nirsoft.net/utils/wifi_information_view.html), etc. | Fixed the problems with persisting the configration file and the language pack in popular buckets with NirSoft applications. |
| [jhentai](https://github.com/jiangtian616/JHenTai)           | A [Flutter](https://flutter.dev/) client for E-Hentai.       |
| [openvpn]()                                                  | Modified from [extra/openvpn](https://github.com/ScoopInstaller/Extras/blob/master/bucket/openvpn.json) to also persist `config-auto` for seamless experience between upgrades for OpenVPNService users. |
| [renamer-pro](http://www.dayanzai.me/renamer-pro.html)       | A cracked version of [RenamerPro](https://www.den4b.com/download/renamer). Requires downloading from Baidu Netdisk with [baidupcs-go](https://github.com/qjfoidnh/BaiduPCS-Go) |
| renamer-alt                                                  | Alternative manifest of renamer-pro with a wizard which allows users to download from Baidu manually if desired, which can be much quicker than baidupcs-go without valid subscription. |
| [tag-folder](https://youtu.be/vyFhSdm4gD8)                   | A bat/powershell/vbs amalgam script for editing tags of folders through context menu. |
| [tag-folder-alt](https://github.com/ChiotOnAGE/TagFolder)    | I implemented similar functionalities as tag-folder in C++ and made a number of improvements to usability and compatibility. |
| [vlang](https://github.com/vlang/v)                          | V programming langauge. Pointing to the latest stable release on. |



## How to use

Run below command in PowerShell to add the bucket:

```powershell
scoop bucket add ztr https://github.com/ZhangTianrong/scoop-bucket
```

Install apps from this bucket with below command:

```powershell
scoop install ztr/<app_name>
```

## Note

Currently, only x64 architecture is supported.
