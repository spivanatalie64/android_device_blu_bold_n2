# Device Tree for BLU Bold N2

## Device Specifications

| Feature | Specification |
|---------|--------------|
| Device | BLU Bold N2 |
| Codename | bold_n2 |
| SoC | MediaTek Dimensity 810 (MT6833) |
| CPU | Octa-core (2x2.4 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55) |
| GPU | Mali-G57 MC2 |
| Memory | 8GB RAM |
| Storage | 256GB |
| Display | 6.6" AMOLED, 1080x2340 pixels |
| Camera (rear) | 64MP main |
| Camera (front) | 16MP |
| Battery | 4200mAh, 30W fast charging |
| Network | 5G, 4G LTE |
| Android Version | 11 (stock), 16 (LineageOS 23) |

## Device Tree Structure

```
android_device_blu_bold_n2/
├── audio/                 # Audio HAL configuration
├── bluetooth/             # Bluetooth configuration
├── keylayout/            # Input device layouts
├── overlay/              # Runtime resource overlays
├── prebuilt-kernel/      # Prebuilt kernel images
│   ├── Image.gz         # Kernel image
│   ├── dtb.img          # Device tree blob
│   └── dtbo.img         # Device tree overlay
├── rootdir/              # Root filesystem files
│   └── etc/
│       ├── fstab.mt6833       # Filesystem table
│       └── init.mt6833.rc     # Init scripts
├── sepolicy/             # SELinux policies
├── wifi/                 # WiFi configuration
├── BoardConfig.mk        # Board configuration
├── device.mk            # Device configuration
├── lineage_bold_n2.mk   # LineageOS product definition
├── extract-files.sh     # Vendor blob extraction script
└── proprietary-files.txt # List of proprietary files
```

## Building LineageOS 23

### Prerequisites

1. Set up LineageOS 23 build environment
2. Initialize repo:
   ```bash
   repo init -u https://github.com/LineageOS/android.git -b lineage-23.0
   repo sync
   ```

### Clone Repositories

```bash
# Device tree
git clone https://github.com/spivanatalie64/android_device_blu_bold_n2 device/blu/bold_n2

# Vendor tree
git clone https://github.com/spivanatalie64/proprietary_vendor_blu vendor/blu

# Kernel (placeholder)
git clone https://github.com/spivanatalie64/android_kernel_blu_bold_n2 kernel/blu/bold_n2
```

### Build

```bash
source build/envsetup.sh
lunch lineage_bold_n2-userdebug
mka bacon
```

Or simply:
```bash
brunch bold_n2
```

## Features

### Working
- ✅ Display
- ✅ Touch
- ✅ Fingerprint (under-display)
- ✅ Face unlock
- ✅ WiFi
- ✅ Bluetooth
- ✅ GPS
- ✅ Camera (basic functionality)
- ✅ Audio
- ✅ Telephony (calls, SMS, data)
- ✅5G/4G/3G
- ✅ USB
- ✅ Charging
- ✅ Sensors

### Notes
- Using prebuilt kernel from stock firmware
- MediaTek orange state disabled for fingerprint support
- Face unlock enabled

## Kernel

Currently using prebuilt kernel extracted from stock firmware (Linux 5.10).

Future work: Extract and build kernel from source.

## Credits

- LineageOS Team
- MediaTek for SoC support
- BLU for device

## License

```
Copyright (C) 2024 The LineageOS Project

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
