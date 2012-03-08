## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_droid2we
PRODUCT_BRAND := verizon
PRODUCT_DEVICE := droid2we
PRODUCT_MODEL := DROID2 Global
PRODUCT_MANUFACTURER := Motorola
PRODUCT_SFX := vzw

# Release name and versioning
PRODUCT_RELEASE_NAME := DROID2 Global

UTC_DATE := $(shell date +%s)
DATE := $(shell date +%Y%m%d)
