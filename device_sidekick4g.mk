#
# Copyright (C) 2009 The Android Open Source Project
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

#
# This is the product configuration for a generic samsung sidekick4g
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

## (2) Also get non-open-source files if available
$(call inherit-product-if-exists, vendor/samsung/sidekick4g/sidekick4g-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	ro.build.PDA=T839UVKG2 \
	ro.build.hidden_ver=T839UVKG2 \
	ro.build.changelist=1035695 \
	ro.tether.denied=false \
	ro.com.android.dataroaming=true \
        ro.telephony.ril_class=samsung \
	windowsmgr.max_events_per_sec=60 \
	windowsmgr.support_rotation_270=true \
	keyinputqueue.use_finger_id=true \
	windowsmgr.max_events_per_sec=55 \
	keyinputqueue.use_finger_id=true \
	media.stagefright.enable-player=true \
	media.stagefright.enable-meta=true \
	media.stagefright.enable-scan=true \
	media.stagefright.enable-http=true \
	net.bt.name=Android \
	ro.opengles.version=131072

DEVICE_PACKAGE_OVERLAYS += device/samsung/sidekick4g/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/sidekick4g/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel 

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
	device/samsung/sidekick4g/asound.conf:system/etc/asound.conf \
	device/samsung/sidekick4g/vold.fstab:system/etc/vold.fstab \
	device/samsung/sidekick4g/egl.cfg:system/lib/egl/egl.cfg



# Init files
PRODUCT_COPY_FILES += \
	device/samsung/sidekick4g/init.smdkc110.rc:root/init.smdkc110.rc \
	device/samsung/sidekick4g/lpm.rc:root/lpm.rc \
	device/samsung/sidekick4g/ueventd.smdkc110.rc:root/ueventd.smdkc110.rc \
	device/samsung/sidekick4g/setupenv.sh:recovery/root/sbin/setupenv.sh	
	
# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	device/samsung/sidekick4g/cypress-touchkey.kl:system/usr/keylayout/cypress-touchkey.kl \
	device/samsung/sidekick4g/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	device/samsung/sidekick4g/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl

# Generated kcm keymaps
PRODUCT_PACKAGES := \
       cypress-touchkey.kcm \
       s3c-keypad.kcm

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/samsung/sidekick4g/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry \
	device/samsung/sidekick4g/media_profiles.xml:system/etc/media_profiles.xml


# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/samsung/sidekick4g/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry \
	device/samsung/sidekick4g/media_profiles.xml:system/etc/media_profiles.xml

# These are the OpenMAX IL modules
PRODUCT_PACKAGES += \
	libSEC_OMX_Core.s5pc110 \
	libOMX.SEC.AVC.Decoder.s5pc110 \
	libOMX.SEC.M4V.Decoder.s5pc110 \
	libOMX.SEC.M4V.Encoder.s5pc110 \
	libOMX.SEC.AVC.Encoder.s5pc110 \
	libaudio
	#libaudio

# Misc other modules
PRODUCT_PACKAGES += \
	sensors.s5pc110\
	lights.s5pc110 \
	overlay.s5pc110 
	#copybit.s5pc110 \

# Libs
PRODUCT_PACKAGES += \
	libstagefrighthw\
	libcamera 

# apns config file
PRODUCT_COPY_FILES += \
        vendor/cyanogen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Bluetooth MAC Address
PRODUCT_PACKAGES += \
	bdaddr_read

# Device-specific packages
PRODUCT_PACKAGES += \
	SamsungServiceMode \
	AriesParts

# Device-specific packages
PRODUCT_PACKAGES += \
	librs_jni 


# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
        frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_COPY_FILES += \
	device/samsung/sidekick4g/updater.sh:updater.sh

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set en_US as default locale
PRODUCT_LOCALES := en_US

# Screen density is actually considered a locale (since it is taken into account
# the the build-time selection of resources). The product definitions including
# this file must pay attention to the fact that the first entry in the final
# PRODUCT_LOCALES expansion must not be a density.
PRODUCT_LOCALES += hdpi

# Live wallpaper packages
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        VisualizationWallpapers

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
        packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0



PRODUCT_NAME := generic_sidekick4g
PRODUCT_DEVICE := sidekick4g
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SGH-T839


