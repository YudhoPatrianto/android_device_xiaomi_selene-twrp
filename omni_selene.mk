#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit from selene device
$(call inherit-product, device/xiaomi/selene/device.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from selene device
$(call inherit-product, device/xiaomi/selene/device.mk)


# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31 \
    
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from selene device
$(call inherit-product, device/xiaomi/selene/device.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery

PRODUCT_PROPERTY_OVERRIDES += \
    ro.bootimage.build.date.utc=0 \
    ro.build.date.utc=0

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := selene
PRODUCT_NAME := omni_selene
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 21061119AG
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="selene-user 11 RP1A.200720.011 V12.5.20.0.RKUMIXM release-keys"

BUILD_FINGERPRINT := Redmi/selene/selene:11/RP1A.200720.011/V12.5.20.0.RKUMIXM:user/release-keys
