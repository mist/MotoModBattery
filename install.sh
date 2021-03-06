#!/bin/bash
ip="192.168.1.253"
if [ "${1}" != "" ] ; then
  ip="${1}"
fi
./gradlew :app:assembleDebug
#used for adb over the network
#if it fails, it will attemp usb adb, I believe
adb connect "${ip}:5555"
#This will fail after first successful install
#adb install app/build/outputs/apk/debug/app-debug.apk
#after a successful install then do a replace install
adb install -r app/build/outputs/apk/debug/app-debug.apk
#launch the app
adb shell monkey -p "com.devilsclaw.motomodbattery" -c android.intent.category.LAUNCHER 1
