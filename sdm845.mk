#
# Copyright (C) 2017-2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit proprietary blobs
$(call inherit-product-if-exists, vendor/lge/sdm845-common/sdm845-common-vendor.mk)

COMMON_PATH := device/lge/sdm845-common

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(COMMON_PATH)/overlay \
    $(COMMON_PATH)/overlay-lineage

# Properties
-include $(COMMON_PATH)/system_prop.mk

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 560dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    vbmeta \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# ANT+
#PRODUCT_PACKAGES += \
#    AntHalService

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default

# Boot animation
TARGET_SCREEN_HEIGHT := 3120
TARGET_SCREEN_WIDTH := 1440

# Boot control
PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Camera
PRODUCT_PACKAGES += \
    Snap

# Display
PRODUCT_PACKAGES += \
    libvulkan

# DAC
PRODUCT_PACKAGES += \
    QuadDACPanel

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/QuadDacPanel.rc:system/etc/init/QuadDacPanel.rc

#Doze
PRODUCT_PACKAGES += \
    LGEDoze

#Fingerprint

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

# FM packages
PRODUCT_PACKAGES += \
	libqcomfm_jni \
	android.hardware.broadcastradio@1.0-impl \
	FM2 \
	qcom.fmradio \
	qcom.fmradio.xml

PRODUCT_BOOT_JARS += qcom.fmradio

#GestureHandler
PRODUCT_PACKAGES += \
	GestureHandler \
	vendor.lineage.touch@1.0-service.judyln

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0-java

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-hotword.xml:system/etc/permissions/privapp-permissions-hotword.xml

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.1-service \
    com.android.nfc_extras \
    NfcNci \
    SecureElement \
    Tag

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

#ThinQ Button
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/Generic.kl:system/usr/keylayout/Generic.kl

# Update engine
PRODUCT_PACKAGES += \
    brillo_update_payload \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.sdm845 \
    libcutils \
    libgptutils \
    libz

PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    hostapd_cli \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwifi-hal-qcom \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf



PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

