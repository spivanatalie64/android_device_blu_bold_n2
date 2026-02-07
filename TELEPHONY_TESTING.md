Telephony and Network Testing for BLU Bold N2

Run these commands on a connected device (adb):

1. Verify RIL and modem properties:
   adb shell getprop rild.libpath && adb shell getprop rild.libargs

2. Check operator and network type:
   adb shell getprop gsm.operator.numeric
   adb shell getprop gsm.network.type

3. Check IMS/VoLTE/VoWiFi state and carrier config:
   adb shell getprop persist.vendor.ims.enable
   adb shell dumpsys telephony.registry

4. Inspect radio logs for modem activity:
   adb logcat -b radio -d | tail -n 200

5. Verify APN entries placed under /etc:
   adb shell ls -l /etc/apns-conf.xml || adb shell ls -l /vendor/etc/apns-conf.xml

6. Trigger network selection and registration by toggling airplane mode:
   adb shell settings put global airplane_mode_on 1
   adb shell am broadcast -a android.intent.action.AIRPLANE_MODE --ez state true
   sleep 3
   adb shell settings put global airplane_mode_on 0
   adb shell am broadcast -a android.intent.action.AIRPLANE_MODE --ez state false

If issues occur, collect `adb bugreport` and radio logs for analysis.
