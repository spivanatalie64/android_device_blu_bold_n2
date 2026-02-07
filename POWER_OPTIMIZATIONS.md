Power optimizations for BLU Bold N2 (MT6833 / Dimensity 810)

What this change does
- Adds a best-effort vendor init script to apply CPU governor and sleep tunables at boot.
- Uses schedutil governor where available and applies conservative up/down rate limits to favor battery life.
- Applies safe cpuidle/lpm tweaks if supported by the kernel.

Files added/modified
- rootdir/vendor/bin/power-init.sh  - script that applies tunables at boot
- rootdir/etc/init.mt6833.rc       - starts the power-init service during post-fs-data
- device.mk                        - installs power-init.sh into the vendor image

Tuning notes
- To further tune battery life, adjust scaling_min_freq and schedutil up/down rate values in power-init.sh.
- If the device exposes interactive governor tunables (hispeed_freq, timer_rate), consider using interactive with conservative settings.
- Check runtime sysfs paths on a live device (/sys/devices/system/cpu/cpufreq/policy*) to determine optimal frequencies for your silicon.

Suspend/resume handling
- This script only applies tunables available from userspace. Proper suspend/resume behavior is mostly governed by the kernel (device tree and platform drivers).
- For advanced suspend handling enable/disable of platform wake sources or tweak lpm_levels parameters in kernel DT/defconfig.

How to test
1. Build and flash a userdebug image.
2. On the device, verify /vendor/bin/power-init.sh ran by checking kernel tunable files under /sys/devices/system/cpu/cpufreq/policy*/.
3. Use battery historian or simple battery drain comparisons to evaluate improvements.

