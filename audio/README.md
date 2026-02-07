Audio configuration changes for BLU Bold N2 (LineageOS 23)

Files added/modified in this directory:

- mixer_paths.xml
  - Provides optimized mixer controls and mixer paths tuned for MediaTek MT6833.
  - Defines playback paths for speaker, headphone, and Bluetooth A2DP/SCO, and a capture path for the main microphone.
  - Includes recommended routing names: playback_speaker, playback_headphone, playback_bt, record_primary.

- audio_effects.conf
  - Minimal effects configuration referencing vendor libraries for equalizer and reverb.
  - Keep these references if corresponding vendor libs are present; otherwise adapt paths to system libs or remove.

Notes and next steps:
- Review actual ALSA mixer control names on target hardware (use 'tinymix' or 'amixer' on-device) and align ctl names in mixer_paths.xml to the real controls (e.g., "SPK Switch" vs "SPK_EN").
- If MediaTek HAL (mtk-audio) expects specific mixer path naming (e.g., "Speaker Playback"), adapt the path and route names accordingly.
- Test speaker/headphone/Bluetooth playback and microphone recording on-device; adjust volume defaults and enable/disable switches as necessary.
- Consider adding device-specific gain tables and usage-specific tuning (voice call vs media playback) under vendor audio policy if required by the HAL.

Change log:
- Initial creation: Added baseline mixer_paths.xml and audio_effects.conf, and documented changes in README.md.
