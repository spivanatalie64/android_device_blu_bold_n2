# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_w.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from bold_n2 device
$(call inherit-product, device/blu/bold_n2/device.mk)

PRODUCT_DEVICE := bold_n2
PRODUCT_NAME := lineage_bold_n2
PRODUCT_BRAND := BLU
PRODUCT_MODEL := BLU Bold N2
PRODUCT_MANUFACTURER := blu

PRODUCT_GMS_CLIENTID_BASE := android-blu

TARGET_VENDOR_PRODUCT_NAME := bold_n2
TARGET_VENDOR_DEVICE_NAME := bold_n2

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="bold_n2-user 16 UP3A.231005.007 20231201 release-keys"

BUILD_FINGERPRINT := BLU/bold_n2/bold_n2:16/UP3A.231005.007/20231201:user/release-keys

# Re-enable fingerprint support by disabling MediaTek orange state
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.fp.orangestate.enable=0