#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2019-2021 The OrangeFox Recovery Project
#

add_lunch_combo omni_m10lte-eng

FDEVICE="m10lte"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	
	# Initial Exports.
	export ALLOW_MISSING_DEPENDENCIES=true
	export LC_ALL="C"
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER="1"
  
        # Maintaining Info.
	export OF_MAINTAINER="perilouspike"
	export FOX_VERSION="R11.1"
	export FOX_BUILD_TYPE="Unofficial-Beta"
	
	# If more than one code name.
	export TARGET_DEVICE_ALT="m10lte, m10ltecis, m10ltexx,m10ltedd, m10lteub, m10lteins, m10ltedtvvj, m10ltekx, m10ltedx, m10f, M105F"
	# Partitions Handling.
	export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY"
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/platform/13540000.dwmmc0/by-name/SYSTEM"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/platform/13540000.dwmmc0/by-name/VENDOR"
	export FOX_RECOVERY_BOOT_PARTITION="/dev/block/platform/13540000.dwmmc0/by-name/BOOT"
	# enable the flashlight feature.
	export OF_FLASHLIGHT_ENABLE="1"
	# Custom flashlight path (if flashlight isn't working).
	export OF_FL_PATH1="/sys/class/camera/flash"
	# If device does not have a PERSIST partition.
	export OF_DEVICE_WITHOUT_PERSIST=1
	# To skip the FBE decryption routines (prevents hanging at the Fox logo or Redmi/Mi logo).
	export OF_SKIP_FBE_DECRYPTION=1
	# Screen Settings (use this if your screen has a different aspect ratio).
	export OF_SCREEN_H=2280
	# Use this only when the device has a cutout.
	#export OF_STATUS_H=81
	#When device has rounded corners.
	#export OF_STATUS_INDENT_LEFT=55 # m10lte Specific
	#export OF_STATUS_INDENT_RIGHT=55 # m10lte Specific
	# Custom clock Position.
	export OF_CLOCK_POS=1
	# Always Enable NavBar (if device doesn't have hardware navigation buttons).
	export OF_ALLOW_DISABLE_NAVBAR=0
        # To enable the advanced security features.
       	export FOX_ADVANCED_SECURITY="1"
        # Auto-detection of system-as-root.
	export OF_USE_TWRP_SAR_DETECT="1"
	# To enable support for block-based incremental OTA on custom ROMs.
	export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
	# To disable the OTA settings by default.
	export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
	# To create a backup of the boot.img from the ROM's zip during the installing of a ROM.
	export OF_OTA_BACKUP_STOCK_BOOT_IMAGE=1
        # *UNTICK* the "Disable Forced Encryption" box on every bootup.
	export OF_KEEP_FORCED_ENCRYPTION="1"
        # Try patch AVB 2.0 so that OrangeFox is not replaced by stock recovery.
	#export OF_PATCH_AVB20="1"
        # For patching the ROM's boot image
	export OF_USE_MAGISKBOOT="1"
        # To use magiskboot for all patching of boot images and recovery images.
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="1"
        # Avoid applying the forced-encryption patches on encrypted devices
	export OF_DONT_PATCH_ENCRYPTED_DEVICE="1"
        # Disable checking for compatibility.zip in ROMs
	export OF_NO_TREBLE_COMPATIBILITY_CHECK="1"
        # lzma compression for your ramdisk
	export FOX_USE_LZMA_COMPRESSION="1"
	# Bash Support
	export FOX_USE_BASH_SHELL="1"
        export FOX_ASH_IS_BASH="1"
        # Tar Support
	export FOX_USE_TAR_BINARY="1"
        # Quick Backup Defaults
	export OF_QUICK_BACKUP_LIST="/boot;/data;/system;/vendor;"
	# Replace the busybox version of the "ps" command.
	export FOX_REPLACE_BUSYBOX_PS="1"
	# Multi-user Backup fix (error 255)
	export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
	# Use the System (ROM) Fingerprint where Available
	#export OF_USE_SYSTEM_FINGERPRINT="1"
        # Recreate /sdcard/ folder after Format data
	export OF_RUN_POST_FORMAT_PROCESS=1
	# Create Odin Flashable .tar files
	export OF_NO_SAMSUNG_SPECIAL=1
        # Common
	export TARGET_ARCH=arm64
        # Delete AromaFM
	export FOX_DELETE_AROMAFM=1
	# try to prevent potential data format errors
	export OF_UNBIND_SDCARD_F2FS=1
	# Prevent Splash Screen Changing
	export OF_NO_SPLASH_CHANGE=0
	
        export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1

	# Let's See what are our Build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
#
