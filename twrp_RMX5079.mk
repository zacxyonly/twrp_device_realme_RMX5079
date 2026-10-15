#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 The TWRP Open Source Project
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit from device configuration
$(call inherit-product, device/realme/RMX5079/device.mk)

# Inherit some common TWRP stuff
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_DEVICE := RMX5079
PRODUCT_NAME := twrp_RMX5079
PRODUCT_BRAND := realme
PRODUCT_MODEL := realme P3 5G
PRODUCT_MANUFACTURER := realme

PRODUCT_GMS_CLIENTID_BASE := android-oppo
