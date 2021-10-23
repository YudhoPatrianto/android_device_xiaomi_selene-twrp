#
<<<<<<< HEAD
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
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

LOCAL_PATH := device/xiaomi/selene

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
BOARD_USE_DYNAMIC_PARTITIONS := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# API
PRODUCT_SHIPPING_API_LEVEL := 30

# V A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# A/B
# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Virtual A/B OTA
$(call inherit-product, \
    $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# A/B
ENABLE_VIRTUAL_AB := true

# A/B
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor


AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-mtkimpl.recovery \
    android.hardware.boot@1.1-mtkimpl

PRODUCT_PACKAGES_DEBUG += \
    bootctrl


PRODUCT_PACKAGES := \
   bootctrl.mt6768 \
   bootctrl.mt6768.recovery

    android.hardware.boot@1.1-impl-recovery \
    android.hardware.boot@1.1-impl \
    android.hardware.boot@1.1-service \
    bootctrl.$(PRODUCT_PLATFORM).recovery

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_PACKAGES += \
    bootctrl.mt6768 \
    libgptutils \
    libz \
    libcutils

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd

    
# Health Hal
PRODUCT_PACKAGES += \
     android.hardware.health@2.1-impl \
     android.hardware.health@2.1-service \
     libhealthd.$(PRODUCT_PLATFORM)
     
# lptool
PRODUCT_PACKAGES += \
    lptools
   
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root) \
            $(LOCAL_PATH)/prebuilt/dtb.img:dtb.img
            
# Use props from system instead from recovery build
TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.product;ro.build.fingerprint;ro.build.version.incremental;ro.product.device=ro.product.system.device;ro.product.model=ro.product.system.model;ro.product.name=ro.product.system.name"

