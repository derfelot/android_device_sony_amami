# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit AOSP Rhine device parts
$(call inherit-product, device/sony/amami/aosp_d5503.mk)

# Inherit Lineage Rhine device parts
$(call inherit-product, device/sony/rhine-common/platform2.mk)

# Inherit Lineage common Phone stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Dalvik/HWUI
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Fingerprint for amami (from stock)
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=D5503
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=Sony/D5503/D5503:5.1.1/14.6.A.1.236/2031203603:user/release-keys
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="D5503-user 5.1.1 14.6.A.1.236 2031203603 release-keys"

# Override Product Name for LineageOS
PRODUCT_NAME := lineage_amami
PRODUCT_MODEL := Xperia Z1 Compact
