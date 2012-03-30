## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-480x854

# Inherit device configuration
$(call inherit-product, device/motorola/droid2we/droid2we.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := droid2we
PRODUCT_NAME := cm_droid2we
PRODUCT_BRAND := verizon
PRODUCT_MODEL := DROID2 Global
PRODUCT_MANUFACTURER := Motorola

