# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 TeamWin Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/samsung/m10lte

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a15

# Arch Suffix
TARGET_USES_64_BIT_BINDER := true
#TARGET_SUPPORTS_64_BIT_APPS := false

# Assert
TARGET_OTA_ASSERT_DEVICE := m10lte, m10ltedd, M105F, m10f, m10ltedx

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_NO_BOOTLOADER := true
PRODUCT_PLATFORM := universal7870
TARGET_BOOTLOADER_BOARD_NAME := exynos7870

# Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM_GPU := mali-t830mp1
TARGET_BOARD_PLATFORM := $(PRODUCT_PLATFORM)
TARGET_SOC := $(TARGET_BOOTLOADER_BOARD_NAME)

# Display
TARGET_SCREEN_DENSITY := 320

# Kernel and bootimg
#BOARD_CUSTOM_BOOTIMG := true
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_IMAGE_NAME := Image
#BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_SEPARATED_DT := true
#TARGET_KERNEL_ARCH := $(TARGET_ARCH)
#TARGET_KERNEL_HEADER_ARCH := $(TARGET_ARCH)
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
#BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
#BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/bootimg.mk
#BOARD_KERNEL_CMDLINE := # Exynos doesn't take cmdline arguments from boot image
#BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive androidboot.selinux=permissive

# Kernel Source
TARGET_KERNEL_CONFIG := m10lte_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/m10lte
#TARGET_KERNEL_CLANG_COMPILE := true
#LC_ALL="C"

# Args
#BOARD_MKBOOTIMG_ARGS += --board SRPRJ29A004RU
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
#BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
#BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
#BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DT := $(DEVICE_PATH)/prebuilt/dt.img
#BOARD_MKBOOTIMG_ARGS += --dt $(TARGET_PREBUILT_DT)
BOARD_KERNEL_SEPARATED_DT := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
#BOARD_CACHEIMAGE_PARTITION_SIZE := 92274688
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 39845888
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2566914048
#BOARD_VENDORIMAGE_PARTITION_SIZE := 251658240
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 12280922112

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

# LZMA support
LZMA_RAMDISK_TARGETS := recovery

# Recovery
BOARD_HAS_DOWNLOAD_MODE := true
#RECOVERY_SDCARD_ON_DATA := true 
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# System as root
#BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
#BOARD_SUPPRESS_SECURE_ERASE := true
#AB_OTA_UPDATER := false

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

# Hack: prevent anti rollback
PLATFORM_VERSION := 16.1.0
PLATFORM_SECURITY_PATCH := 2099-12-31
#BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
#PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Android Verified Boot
BOARD_AVB_ENABLE := false
BOARD_BUILD_DISABLED_VBMETAIMAGE := true

# Crypto
#TW_INCLUDE_FBE := true
#TW_INCLUDE_CRYPTO := true
#TW_INCLUDE_CRYPTO_FBE := true
#BOARD_USES_QCOM_DECRYPTION := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
#TW_INCLUDE_FASTBOOTD := true
#TW_INCLUDE_NTFS_3G := true
#TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_NO_REBOOT_BOOTLOADER := true

# Set brightness path and level
#TW_MAX_BRIGHTNESS := 1000
#TW_DEFAULT_BRIGHTNESS := 500
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"

# Include some binaries
#TW_INCLUDE_LIBRESETPROP := true
#TW_INCLUDE_REPACKTOOLS := true
#TW_INCLUDE_RESETPROP := true
#TW_INCLUDE_BASH := true

# Languages
TW_EXTRA_LANGUAGES := true
#TW_DEFAULT_LANGUAGE := en

# exFAT/NTFS Support
#TW_INCLUDE_FUSE_EXFAT := true
#TW_INCLUDE_FUSE_NTFS := true

# Use Toolbox instead of Busybox
TW_USE_TOOLBOX := true

# Debug-tools
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Maintainer/Version
#TW_DEVICE_VERSION := perilouspike

# Statusbar icons flags
#TW_STATUS_ICONS_ALIGN := center
#TW_CUSTOM_CPU_POS := 400
#TW_CUSTOM_CLOCK_POS := 200
#TW_CUSTOM_BATTERY_POS := 800

# deal with "error: overriding commands for target" problems
#BUILD_BROKEN_DUP_RULES := true
#BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
