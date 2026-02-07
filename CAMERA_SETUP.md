BLU Bold N2 camera setup (MT6833 ISP)

Summary:
- Rear sensor: 64MP
- Front sensor: 16MP
- ISP: MediaTek MT6833

Changes made:
- Updated overlay camera params to report 64MP rear / 16MP front and increased max resolution.
- Extended media_profiles to add 3840x2160 (2160p) encoder profiles (H.264 and HEVC) and increased encoder caps.

Notes / next steps:
- Verify vendor camera HAL libraries are present in proprietary/vendor blobs for MTK MT6833.
- If capture sizes still limited, add camera_characteristics/metadata or device-specific camera HAL XML files under vendor overlays.
- Test: capture 4K video (2160p) and verify encoder selection; run camera CTS if available.
