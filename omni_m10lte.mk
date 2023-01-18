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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Otherwise, If you have 32-bit device, add the below line instead of above line
#$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk)

# Inherit from Omni-common Stuff.
$(call inherit-product, vendor/omni/config/common.mk)
#$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the Device Tree itself.
$(call inherit-product, device/samsung/m10lte/device.mk)

PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/dt.img:boot.img

# Device identifier. This must come after all inclusions
PRODUCT_RELEASE_NAME := m10lte
PRODUCT_DEVICE := m10lte
PRODUCT_NAME := omni_m10lte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-M105F
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="m10ltedd-user 10 QP1A.190711.020 M105FDDS4CVG1 release-keys"

BUILD_FINGERPRINT := samsung/m10ltedd/m10lte:10/QP1A.190711.020/M105FDDS4CVG1:user/release-keys
