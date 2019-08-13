@echo off
echo Please wait.....
taskkill /F /IM adb.exe > NUL 2>&1
adb connect 192.168.8.1:5555 > NUL 2>&1
cls
adb shell sh /online/cronjob/delcron.sh
cls
echo cron has been remove!
taskkill /F /IM adb.exe > NUL 2>&1
pause