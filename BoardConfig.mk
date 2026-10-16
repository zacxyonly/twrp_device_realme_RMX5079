#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 The TWRP Open Source Project
#

DEVICE_PATH := device/realme/RMX5079

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

# Platform
TARGET_BOARD_PLATFORM := volcano
TARGET_BOOTLOADER_BOARD_NAME := volcano
TARGET_NO_BOOTLOADER := true

# Kernel & Boot Image Header v4
BOARD_BOOTIMG_HEADER_VERSION := 4
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_DTB_OFFSET := 0x01f00000

BOARD_KERNEL_CMDLINE := video=vfb:640x400,bpp=32,memsize=3072000 log_buf_len=2M nosoftlockup bootconfig
BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0x984000
BOARD_BOOTCONFIG := androidboot.hardware=qcom androidboot.memcg=1 androidboot.usbcontroller=a600000.dwc3 androidboot.load_modules_parallel=true

# Prebuilt Kernel & DTB
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Partitions & File Systems
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_HAS_NO_REAL_SDCARD := false
BOARD_USES_RECOVERY_AS_BOOT := false
TARGET_NO_RECOVERY := false
BOARD_USES_METADATA_PARTITION := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_COPY_OUT_VENDOR := vendor
BOARD_USES_VENDORIMAGE := true

# Dynamic Partitions (Super)
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    system_ext \
    product \
    vendor \
    vendor_dlkm \
    system_dlkm \
    odm \
    my_product \
    my_company \
    my_carrier \
    my_region \
    my_heytap \
    my_stock \
    my_preload \
    my_manifest \
    my_engineering \
    my_bigball

# Encryption
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_SUPPRESS_SECURE_ERASE := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_USE_TOOLBOX := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_REPACKTOOLS := true
TW_NO_SCREEN_TIMEOUT := true
TW_NO_EXFAT_FUSE := true
TW_HAS_MTP := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_SKIP_ADDITIONAL_RELINK := true
TW_DEVICE_VERSION := 1

# Logging
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Brightness control
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 1024

# Vendor Kernel Modules
# TW_LOAD_VENDOR_MODULES: loaded by TWRP at runtime (order matters)
TW_LOAD_VENDOR_MODULES := "smem.ko oplusboot.ko buildvariant.ko boot_mode.ko oplus_bsp_boot_projectinfo.ko oplus_charger_present.ko oplus_ftm_mode.ko panel_event_notifier.ko olc.ko device_info.ko oplus_bsp_tp_notify.ko oplus_bsp_fw_update.ko oplus_bsp_tp_custom.ko oplus_bsp_tp_common.ko oplus_bsp_tp_focal_common.ko oplus_bsp_tp_ft3518.ko oplus_bsp_synaptics_tcm2.ko"

# BOARD_VENDOR_KERNEL_MODULES_LOAD: loaded during first stage init
BOARD_VENDOR_KERNEL_MODULES_LOAD := \
    smem.ko \
    oplusboot.ko \
    buildvariant.ko \
    boot_mode.ko \
    oplus_bsp_boot_projectinfo.ko \
    oplus_charger_present.ko \
    oplus_ftm_mode.ko \
    panel_event_notifier.ko \
    olc.ko \
    device_info.ko \
    oplus_bsp_tp_notify.ko \
    oplus_bsp_fw_update.ko \
    oplus_bsp_tp_custom.ko \
    oplus_bsp_tp_common.ko \
    oplus_bsp_tp_focal_common.ko \
    oplus_bsp_tp_ft3518.ko \
    oplus_bsp_synaptics_tcm2.ko
