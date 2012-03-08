#
# Copyright (C) 2012 bikedude880
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

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Device overlay and prebuilt directories
DEVICE_PACKAGE_OVERLAYS += device/motorola/droid2we/overlay
DEVICE_PREBUILT := device/motorola/droid2we/prebuilt

# Audio
PRODUCT_COPY_FILES += \
    device/motorola/droid2we/audio/libaudio.so:/system/lib/libaudio.so \
    device/motorola/droid2we/audio/liba2dp.so:/system/lib/liba2dp.so

PRODUCT_PACKAGES := \
    audio.primary.omap3 \
    libaudiohw_legacy \
    audio.a2dp.default \
    libaudioutils

PRODUCT_PACKAGES += \
    hijack-boot.zip \

# Hijack files
PRODUCT_COPY_FILES += \
    $(DEVICE_PREBUILT)/bin/hijack:system/bin/hijack \
    $(DEVICE_PREBUILT)/bin/hijack.log_dump:system/bin/hijack.log_dump \
    $(DEVICE_PREBUILT)/etc/hijack-boot.zip:system/etc/hijack-boot.zip

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/motorola/droid2we/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel

# copy all kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
    find device/motorola/droid2we/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')

PRODUCT_PROPERTY_OVERRIDES += \
    persist.ril.features=0x0E \
    persist.ril.modem.ttydevice=/dev/usb/tty1-3:1.4 \
    persist.ril.mux.noofchannels=8

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from droid2we device
$(call inherit-product, device/motorola/droid2we/device.mk)

PRODUCT_NAME := cm_droid2we
PRODUCT_DEVICE := droid2we
PRODUCT_BRAND := verizon
PRODUCT_MODEL := DROID2 Global
