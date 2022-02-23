## Become a developer

Settings & tools > Settings > About phone > Software information > Build number > Click 7 times

Settings & tools > Developer options > USB debugging > On

```bash
brew install android-platform-tools
```

## Remove junks

Connect the phone to the computer > Allow

```bash
adb devices # > Prompt > Allow USB debugging
```

```bash
adb shell pm list packages | grep verizon

adb shell pm list packages | grep vzw

adb shell pm list packages | grep carrier
```

```bash
adb shell pm uninstall -k --user 0 com.verizon.mips.services

adb shell pm uninstall -k --user 0 com.verizon.obdm_permissions

adb shell pm uninstall -k --user 0 com.verizon.bootstrapclient

adb shell pm uninstall -k --user 0 com.verizon.obdm

adb shell pm uninstall -k --user 0 com.verizon.mdm.xvlte

adb shell pm uninstall -k --user 0 com.verizon.mdm.pushtotalkplus

adb shell pm uninstall -k --user 0 com.verizon.pushtotalkplus

adb shell pm uninstall -k --user 0 com.vzw.hss.myverizon

adb shell pm uninstall -k --user 0 com.vzw.apnlib

adb shell pm uninstall -k --user 0 jp.kyocera.vzwextension.service

adb shell pm uninstall -k --user 0 com.vcast.mediamanager

adb shell pm uninstall -k --user 0 com.ffm.kyocera

adb shell pm uninstall -k --user 0 com.mobisystems.office.kyocera

adb shell pm uninstall -k --user 0 com.android.email

adb shell pm uninstall -k --user 0 com.android.carrierdefaultapp

adb shell pm uninstall -k --user 0 com.android.carrierconfig
```

## Settings & tools >

### Wireless & networks

Wifi >

Tethering & Mobile Hotspot > Mobile Hotspot >

- Hotspot name > lemo phone

- Hotspot password >

Cellar networks >

- Access Point Names > New APN > https://www.t-mobile.com/support/devices/not-sold-by-t-mobile/byod-t-mobile-data-and-apn-settings

- Data usage > Data warning & limit > Alert size > 1GB

### Accessibility

Speech rate > Fast

### Sound settings

Phone ringtone > Ringtone 4

Vibration intensity > Strong

Notification sound > Message tone 4

Other sounds and vibrations > Keypad tone > Off

### Display settings

Display backlight > 1 minute

### Phone settings

Language & input > Text options > Next word complete > On

Pointer >

- Pointer size > Small

Accounts > Automatically sync data > Off

Date & time > Use 24-hour format > On

### Call settings

Any key answer > Off

## Message > Options > Settings >

Group messaging > On

## Camera > Settings >

Video size > High

Shutter sound > Off

## Browser > Options > Settings > Settings >

Set homepage >

Privacy & security > Enable location > Off

## Install mouse

```bash
adb install a4fmouse.apk
```

```bash
adb shell pm uninstall -k --user 0 com.lge.voicecommand

adb shell appops set com.android.cts.appsflipcursor SYSTEM_ALERT_WINDOW allow

adb shell settings put secure accessibility_enabled 1

adb shell settings put secure enabled_accessibility_services com.android.cts.appsflipcursor/com.android.cts.appsflipcursor.services.MouseEventService

adb shell am startservice com.android.cts.appsflipcursor/com.android.cts.appsflipcursor.services.MouseEventService
```

## Install apps

```bash
adb install Spotify_8.7.0.1147_apkcombo.com.apk

adb install Signal-Android-website-prod-universal-release-5.32.7.apk
```
