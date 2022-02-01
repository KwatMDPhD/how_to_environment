## Reset disk

Restart > `Cmd + R` > Boot into recovery mode

Disk Utility > Internal > (Disk name) > Erase > APFS (Case-sensitive)

Erase all volumes except the base

Make a new case-sensitive, encrypted volume

Reinstall macOS

## Update software

System Preferences > Software Update

## TODO

Preferences /

Sharing /
Computer Name / (lemo create)
AirPlay Receiver / Uncheck

Apple ID / iCloud /
Private Relay / Check
News / Uncheck
Stocks / Uncheck
Home / Uncheck
Siri / Uncheck

Family Sharing /
Location Sharing / (Name) / (Check)
Purchase Sharing / Share My Purchase / Check

General /
Click in the scroll bar to: / Jump to the spot that’s clicked
Ask to keep changes when closing documents / Check

Desktop & Screen Saver /
Desktop / Monterey Graphic / Dynamic

Dock & Menu Bar /
Automatically hide and show the Dock / Check
Automatically hide and show the menu bar on desktop / Check
* / Show in Menu Bar / Uncheck
Battery / Show percentage / Check
Clock / Use 24-hour clock / Check
Display the time with seconds / Check

Dock should only have Finder, running apps, Downloads, and Trash.

Mission Control /
Automatically rearrange Spaces based on most recent use / Uncheck
Hot Corners / Desktop, Notification Center, Mission Control, Application Windows

Siri /
Siri Suggestions & Privacy / * / * / Uncheck

Language & Region /
Temperature / C - Celsius
Advanced / First day of week / Monday

Notification & Focus / Focus /
* except “Do Not Disturb” / -
Do Not Disturb / Do Not Disturb / On
Share Focus Status / Uncheck

Internet Accounts /
Game Center / -
* / ONLY Mail / Check

Wallet & Apple Pay / Add Card / Only Apple Card

Users & Groups
Guest User / (Make sure it is disabled)

Extensions / Share Menu /
Open in News / Uncheck
Add to Reading List / Uncheck

Security & Privacy /
Location Services / System Services / Details / ONLY Show location icon in menu bar when System Service request your location / Check
Location Services / Enable Location Services / Uncheck
Apple Advertising / Personalized Ads / Uncheck
Analytics & Improvements / * / Uncheck

Software Update / Automatically keep my Mac up to date / Uncheck

Network / Wi-Fi / Advanced / AS MANY Network Name / -

Touch ID / Finger 1 / * / Check

Keyboard /
Key Repeat / Fastest
Delay Until Repeat / Shortest
Touch Bar shows / Expanded Control Strip
Customize Control Strip / Keyboard Brightness, Space, Brightness, Space, Volume, Space, Media, Space, Night Shift, Space, Sleep

Trackpad /
Point & Click / Tap to click / Check
Point & Click / Click / Light
Point & Click / Tracking speed / 4th fastest
More Gestures / App Expose / Check

Mouse / * / 4th Fastest


Finder / Preferences /

General / New Finder window show: / (Kwat)
Tags / * / Uncheck
Sidebar / Favorites / AirDrop, Recents, Applications, (Kwat)
Advanced / Show all filename extensions / Check
Advanced / Show warning before removing from iCloud Drive / Uncheck
Advanced / Show warning before emptying the Trash / Uncheck
When performing a search / Search the Current Folder

Show items in a list / Show View Options /
Icon size / Large
Show columns: / Data Modified, Size
Calculate all sizes / Check
Use as Defaults



## Simlify dock

Remove everything

## Set System Preferences

## Set Finder Preferences

## Get Brew and program

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```sh
brew install tree rename macvim fzf ripgrep node yarn pyenv-virtualenv shfmt git-lfs
```

## Set MacVim

Preferences > General > Open untitled window > never

Preferences > General > Open files from applications > in the current window

## Get software

XCode

Docker

SensibleSideButtons

Corsair iCUE

OBS

Sony Imaging Edge Webcam

Zoom

Spotify

## Get Safari extension

(Ad block)

Vimari

Vimari > Open Configuration File >

```json
"excludedUrls": "localhost,tinkercad.com",
```
