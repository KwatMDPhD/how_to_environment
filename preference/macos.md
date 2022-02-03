## Reset disk

Restart > `Cmd + R`

Disk Utility > Internal > NAME > Erase > APFS

Have only 1 volume.

Reinstall macOS.

Location > :thumbsdown:

Analytics > :thumbsdown:

Siri > :thumbsdown:

## Set System Preferences

### Software Update

UPDATE.

Automatically keep my Mac up to date > :thumbsdown:

### Sharing

Computer Name > NAME

AirPlay Receiver > :thumbsdown:

### Apple ID

iCloud > Private Relay > :thumbsup:

iCloud > News > :thumbsdown:

iCloud > Stocks > :thumbsdown:

iCloud > Home > :thumbsdown:

iCloud > Siri > :thumbsdown:

### Family Sharing

Location Sharing > NAME > :thinking:

Purchase Sharing > Share My Purchase > :thumbsup:

### General

Click in the scroll bar to: > Jump to the spot that’s clicked

Ask to keep changes when closing documents > :thinking:

### Desktop & Screen Saver

Desktop > Monterey Graphic > Dynamic

### Dock & Menu Bar

Automatically hide and show the Dock > :thumbsup:

Automatically hide and show the menu bar on desktop > :thumbsup:

ALL > Show in Menu Bar > :thumbsdown:

Battery > Show percentage > :thumbsup:

Clock > Use 24-hour clock > :thumbsup:

Display the time with seconds > :thumbsup:

Dock > ALL except Finder & Reminders & Downloads & Trash > :skull_and_crossbones:

### Mission Control

Automatically rearrange Spaces based on most recent use > :thumbsdown:

Hot Corners > (top left) Desktop (top right) Notification Center (bottom left) Mission Control (bottom right) Application Windows

### Siri

Siri Suggestions & Privacy > ALL > ALL > :thumbsdown:

### Language & Region

Temperature > C - Celsius

Advanced > First day of week > Monday

### Notifications & Focus

Notifications > ALL except Calender & FaceTime & Mail & Messages & Reminders & Safari & Screen Time & Wallet & Zoom > Allow Notifications > :thumbsdown:

Focus > ALL except Do Not Disturb > :skull_and_crossbones:

Focus > Share Focus Status > :thumbsdown:

### Internet Accounts

Game Center > :skull_and_crossbones:

ALL > ALL except Mail > :thumbsdown:

### Wallet & Apple Pay

Add Card > Apple Card

### Users & Groups

Guest User > Off

### Extensions

Share Menu > Open in News > :thumbsdown:

Share Menu > Add to Reading List > :thumbsdown:

### Security & Privacy

Location Services > System Services > Details > ALL except Show location icon in menu bar when System Service request your location > :thumbsdown:

Location Services > Enable Location Services > :thumbsdown:

Analytics & Improvements > ALL > :thumbsdown:

Apple Advertising > Personalized Ads > :thumbsdown:

### Network

Wi-Fi > Advanced > AS MANY Network Name > :skull_and_crossbones:

### Touch ID

Add Fingerprint > 4TH DIGITS OF BOTH HANDS > Use Touch ID for: > ALL > :thumbsup:

### Keyboard

Keyboard > Key Repeat > Fastest

Keyboard > Delay Until Repeat > Shortest

Keyboard > Touch Bar shows > Expanded Control Strip

Keyboard > Customize Control Strip > SPACE JOINING Keyboard Brightness & Brightness & Volume & Media & Night Shift & Sleep

Input Sources > ADD LANGUAGES

Dictation > Dictation > Off

### Trackpad

Point & Click > Tap to click > :thumbsup:

Point & Click > Click > Light

Point & Click > Tracking speed > 4th fastest

More Gestures > App Expose > :thumbsup:

### Mouse

ALL > 4th fastest

## Set Finder Preferences

General > New Finder window show: > USER

Tags > ALL > :thumbsdown:

Sidebar > Favorites > AirDrop & Recents & Applications & USER

Advanced > Show all filename extensions > :thumbsup:

Advanced > Show warning before removing from iCloud Drive > :thumbsdown:

Advanced > Show warning before emptying the Trash > :thumbsdown:

When performing a search > Search the Current Folder

## Set Finder view

### Show items in a list > Show View Options

Icon size > Large

Show columns: > Data Modified & Size

Calculate all sizes > :thumbsup:

Use as Defaults.

Desktop > Sort By > Date Modified

## Install software

### From .dmg

SensibleSideButtons

Sony Imaging Edge Webcam

OBS

Zoom

Corsair iCUE

Spotify

### From brew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```sh
brew install tree rename macvim fzf ripgrep node yarn pyenv-virtualenv shfmt git-lfs
```

## Set Terminal Preferences

Import [../export/\*.terminal](https://github.com/KwatMDPhD/environment/tree/main/export/).

## Set iCUE Preferences

Import [../export/one_for_all.cueprofile](https://github.com/KwatMDPhD/environment/tree/main/export/one_for_all.cueprofile).

## Set MacVim Preferences

### Preferences > General

Open untitled window > never

Open files from applications > in the current window

## Set Messages Preferences

### General

Do not set up name or photo.

### iMessage

Send read receipts > :thumbsdown:

### Shared with You

Automatic Sharing > Off

ALL > :thumbsdown:

## Set Zoom Preferences

### General

Copy invite link when starting a meeting > :thumbsup:

Show my meeting duration > :thumbsup:

Add zoom to macOS menu bar > :thumbsdown:

Stop my video and audio when my display is off or screen saver begins > :thumbsup:

### Video

Always display participant name on their videos

Stop my video when joining a meeting

### Audio

Speaker > Same as System

Microphone > Same as System

Automatically join computer audio when joining a meeting > :thumbsup:

Mute my mic when joining a meeting > :thumbsup:

Press and hold "Space Key" to temporarily unmute > :thumbsdown:

### Share Screen

Window size when screen sharing: > Maintain current size

When I share directly to a Zoom Room > Show all sharing options > :thumbsup:

### Recording

Store my recordings at: > Downloads

Record a separate audio file of each participant > :thumbsup:

Optimize for 3rd party video editor > :thumbsup:

Add a timestamp to the recording > :thumbsup:

## Set Spotify Preferences

### Audio quality

Streaming quality > Very high

Download > Very high

### Display

Show announcements about new releases > :thumbsdown:

See what your friends are playing > :thumbsdown:

### Show advanced settings

Startup and window behavior > Open Spotify automatically after you log into the computer > No

## Get Safari extension

(Ad block)

Vimari > Open Configuration File >

```json
"excludedUrls": "localhost,tinkercad.com",
```
