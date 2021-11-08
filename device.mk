#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/selene

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# API
PRODUCT_SHIPPING_API_LEVEL := 30

# V A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# A/B
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
    
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root) 
