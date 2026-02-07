# BLU Bold N2 Device Tree for LineageOS 23

This is the device tree for building LineageOS 23 (Android 16) for the BLU Bold N2.

## Specifications
- Chipset: MediaTek Dimensity 810 (MT6833)
- Display: 6.6" AMOLED, 1080x2340
- RAM: 8GB
- Storage: 256GB
- Battery: 4200mAh with 30W fast charging
- Cameras: 64MP main, 16MP front
- Biometrics: Under-display fingerprint, Face unlock
- Android Version: 16 (LineageOS 23)

## LineageOS Submission
This device tree is prepared for submission to LineageOS. Ensure the following:
- Vendor blobs are pushed to TheMuppets repo
- Kernel source is in android_kernel_blu_bold_n2
- Device tree follows LOS coding standards
- All dependencies are met
- Note: Targeting Android 16 (future release)

## Notes
- Face unlock is enabled.
- Fingerprint support is re-enabled by disabling MediaTek orange mode, allowing fingerprint authentication even after PIN/pattern unlock.

## Build Instructions
1. Set up LineageOS 23 build environment.
2. Place this device tree in device/blu/bold_n2
3. Add kernel source to kernel/blu/bold_n2
4. Add vendor blobs to vendor/blu/bold_n2
5. Build with: `brunch bold_n2`

## ADB Troubleshooting
If you can't see your phone via ADB:
- Ensure USB debugging is enabled in Developer Options
- Try different USB ports and cables
- Set USB mode to "File Transfer" or "PTP"
- On Windows, install Google USB drivers
- If still not working, boot to recovery and try ADB sideload, or extract from stock ROM manuallyzz