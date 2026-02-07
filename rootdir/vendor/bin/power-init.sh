#!/system/bin/sh
# Power init script for MT6833 (Dimensity 810) - best-effort safe tunables

# Set governors to schedutil and apply tunables for each policy
for policy in /sys/devices/system/cpu/cpufreq/policy*; do
  if [ -f "$policy/scaling_governor" ]; then
    echo schedutil > "$policy/scaling_governor" 2>/dev/null || true
  fi
  # conservative min freq for battery life
  if [ -f "$policy/scaling_min_freq" ]; then
    echo 200000 > "$policy/scaling_min_freq" 2>/dev/null || true
  fi
  # schedutil tunables
  if [ -d "$policy/schedutil" ]; then
    if [ -f "$policy/schedutil/up_rate_limit_us" ]; then
      echo 20000 > "$policy/schedutil/up_rate_limit_us" 2>/dev/null || true
    fi
    if [ -f "$policy/schedutil/down_rate_limit_us" ]; then
      echo 20000 > "$policy/schedutil/down_rate_limit_us" 2>/dev/null || true
    fi
  fi
done

# Reduce screen-off wakeups by reducing kernel message logging
if [ -f /proc/sys/kernel/printk ]; then
  # Keep default but reduce verbosity
  echo "3 4 1 7" > /proc/sys/kernel/printk 2>/dev/null || true
fi

# Tunables for cpuidle / lpm_levels
if [ -f /sys/module/lpm_levels/parameters/sleep_disabled ]; then
  echo N > /sys/module/lpm_levels/parameters/sleep_disabled 2>/dev/null || true
fi

# Increase suspend timeout for pm freeze if present
if [ -f /sys/power/pm_freeze_timeout ]; then
  echo 5000 > /sys/power/pm_freeze_timeout 2>/dev/null || true
fi

exit 0
