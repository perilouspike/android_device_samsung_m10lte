####################################################################
# SHRP stuffs - specific lines                                     #                        
####################################################################
# NOTE - Dont use '-' or blank spaces in flag values , otherwise it will create build errors or other bugs in recovery (Excluding SHRP_PATH,SHRP_REC).

# Mandatory flags

# Path of your SHRP Tree *
SHRP_PATH := device/samsung/m10lte
# Maintainer name *
SHRP_MAINTAINER := perilouspike
# Device codename *
SHRP_DEVICE_CODE := m10lte
# Recovery Type (It can be treble,normal,SAR) [Only for About Section] *
SHRP_REC_TYPE := Treble
# Recovery Type (It can be A/B or A_only) [Only for About Section] *
SHRP_DEVICE_TYPE := A_only
# Your device's recovery path, dont use blindly *
SHRP_REC := /dev/block/platform/13540000.dwmmc0/by-name/RECOVERY

#Important flags

# Emergency DownLoad mode (0 = no EDL mode, 1 = EDL mode available)
SHRP_EDL_MODE := 0
# Storage paths, put your device's storage paths from fstab *
SHRP_EXTERNAL := /sdcard1	
SHRP_INTERNAL := /sdcard	
SHRP_OTG := /usb-otg
# Put 0 to disable flashlight *
SHRP_FLASH := 1
# custom led paths for flashlight
SHRP_CUSTOM_FLASHLIGHT := true
SHRP_FONP_1 := /sys/class/camera/flash/rear_torch_flash

# Optional flags

# SHRP padding flag (for rounded corner devices only). You have to change these values according to your device's roundness.
SHRP_STATUSBAR_RIGHT_PADDING := 48
SHRP_STATUSBAR_LEFT_PADDING := 48
# SHRP Express, enables on-the-fly theme patching (also persistent) + persistent lock [Optional]
SHRP_EXPRESS := true
# SHRP Dark mode, use this flag to have dark theme set by default [Optional]
#SHRP_DARK := true
# Max Brightness of LED [Optional]
SHRP_FLASH_MAX_BRIGHTNESS := 210
# Use this flag only if your device is A/B.
#SHRP_AB := true
# For notch devices
SHRP_NOTCH := true

# Default addons

#Substratum Overlay (OMS -legacy- disabler)
INC_IN_REC_ADDON_2 := true
#Force Encryption (remove force encryption from your device)
INC_IN_REC_ADDON_4 := true

# Custom addons

# Custom addon folder.
SHRP_EXTERNAL_ADDON_PATH := "device/samsung/m10lte/configs/addon/"
# Addon name
SHRP_EXTERNAL_ADDON_1_NAME := "Multidisabler"
# Addon description
SHRP_EXTERNAL_ADDON_1_INFO := "Disables FBE, proca, Vaultkeeper and auto-reflash of stock recovery on Samsung devices"
# Addon file name as ZIP
SHRP_EXTERNAL_ADDON_1_FILENAME := "Multidisabler.zip"
# Addon defineable button text
SHRP_EXTERNAL_ADDON_1_BTN_TEXT := "Flash"
# Addon shown when the installation was successful
SHRP_EXTERNAL_ADDON_1_SUCCESSFUL_TEXT := "Installed"
#  Inject the addon into the recovery
SHRP_INC_IN_REC_EXTERNAL_ADDON_1 := true

#


