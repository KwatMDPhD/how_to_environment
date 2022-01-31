## Developer mode

Become a developer

Enable USB debugging

Remove junk

## Network

Add WiFi

Enable WiFi calling

Add APN

## Setting

Enable group message

Any key answer > Off

Data warning > 1GB

Message tone 4

Notification tone 4

Vibration > strong

Keypad tone > Off

Speech rate > Fast

Next word complete > On

Pointer speed > Fast

Pointer size > Small

Automatically sync data > Off

24hr time > On

## Camera

Shutter sound > Off

Video size > High

## Install apps

```sh
adb install ~/Downloads/Spotify_8.7.0.1147_apkcombo.com.apk
```

## Install mouse

```sh
adb install ~/Downloads/a4fmouse.apk
```

```sh
adb shell pm uninstall -k --user 0 com.lge.voicecommand

adb shell appops set com.android.cts.appsflipcursor SYSTEM_ALERT_WINDOW allow

adb shell settings put secure accessibility_enabled 1

adb shell settings put secure enabled_accessibility_services com.android.cts.appsflipcursor/com.android.cts.appsflipcursor.services.MouseEventService

adb shell am startservice com.android.cts.appsflipcursor/com.android.cts.appsflipcursor.services.MouseEventService
```

## Remove junk

```sh
adb shell pm list packages | grep verizon

adb shell pm list packages | grep vzw

adb shell pm uninstall -k --user 0 com.verizon.mips.services

adb shell pm uninstall -k --user 0 com.verizon.obdm_permissions

adb shell pm uninstall -k --user 0 com.vzw.hss.myverizon

adb shell pm uninstall -k --user 0 com.verizon.bootstrapclient

adb shell pm uninstall -k --user 0 com.verizon.obdm

adb shell pm uninstall -k --user 0 com.verizon.mdm.xvlte

adb shell pm uninstall -k --user 0 com.verizon.mdm.pushtotalkplus

adb shell pm uninstall -k --user 0 com.verizon.pushtotalkplus

adb shell pm uninstall -k --user 0 com.vzw.apnlib

adb shell pm uninstall -k --user 0 jp.kyocera.vzwextension.service
```
