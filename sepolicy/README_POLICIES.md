BLU Bold N2 SELinux policy notes

This directory contains device-specific SELinux policy stubs and file contexts for the BLU Bold N2 (MediaTek MT6833).

Files added:
- fingerprint.te: rules and types for fingerprint daemon and device nodes
- camera.te: camera HAL and device access rules
- audio.te: audio HAL / audioserver access rules
- wifi_bt.te: WiFi and Bluetooth daemon/device rules
- gps.te: GPS / GNSS HAL rules
- mediatek_services.te: Mediatek vendor-specific service stubs
- file_contexts: initial file contexts mapping device nodes and vendor binaries

Decisions and next steps:
1. These files are initial stubs to be tested on-device. They intentionally include TODOs where runtime denials must inform finer-grained permissions.
2. Research required: MediaTek MT6833 specific device node names (e.g., /dev/ttyMT*, /dev/mtk_*), firmware paths, and exact HAL binary names.
3. Testing: Push to device, run logcat to capture SELinux denials, and iteratively add allow rules and file_contexts. Use `adb shell dmesg | grep avc` and `adb logcat` to capture denials.
4. When denials are available, update the corresponding .te files and file_contexts, then re-run sepolicy compilation if needed as part of the build.

If you want, I can now attempt to run a local search for existing Mediatek/LINEAGE device policy snippets in this tree to copy proven rules into these files, or fetch upstream references.
