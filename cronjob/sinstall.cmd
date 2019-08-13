@echo off
echo Please wait.....
taskkill /F /IM adb.exe > NUL 2>&1
adb connect 192.168.8.1:5555 > NUL 2>&1
adb push cronjob.tar.gz /tmp/ > NUL 2>&1
adb shell mkdir -p /online/cronjob
adb shell tar -zxvf /tmp/cronjob.tar.gz -C /online/cronjob > NUL 2>&1
adb shell chmod 755 /online/cronjob/*
adb shell mount -o remount, rw /system
adb shell "echo \"/online/cronjob/reboot.sh\" >> /system/etc/autorun.sh"
adb shell mount -o remount,ro /system /system
cls
echo Success.
adb shell sleep 2
cls
echo rebooting after 3s.
adb shell sleep 1
echo 3
adb shell sleep 1
echo 2
adb shell sleep 1
echo 1
adb shell sleep 1
cls
echo Done...
echo Jobs will run every 2 hours.
adb shell sleep 1
adb shell reboot
taskkill /F /IM adb.exe > NUL 2>&1
pause