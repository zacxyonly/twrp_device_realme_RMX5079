#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 The TWRP Open Source Project
#

LOCAL_PATH := device/realme/RMX5079

# Build standalone recovery image
PRODUCT_BUILD_RECOVERY_IMAGE := true

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Update engine (A/B)
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# Recovery dependencies are handled automatically by TWRP build system
# via TARGET_RECOVERY_FSTAB and device/realme/RMX5079/recovery/root
