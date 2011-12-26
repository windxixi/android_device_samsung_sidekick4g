# Copyright (C) 2007 The Android Open Source Project
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

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

# inherit from the proprietary version
#-include vendor/samsung/sidekick4g/BoardConfigVendor.mk

# Board properties Hardware
TARGET_BOARD_PLATFORM := s5pc110
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := false
#TARGET_BOOTLOADER_BOARD_NAME := aries
#TARGET_BOOTLOADER_BOARD_NAME := SGH-T839
TARGET_BOOTLOADER_BOARD_NAME := s5pc110

# Connectivity - Wi-Fi
WPA_SUPPLICANT_VERSION 	    := VER_0_6_X
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WLAN_DEVICE 	    := bcm4329
WIFI_FIRMWARE_LOADER        := "wlan_loader"
WIFI_DRIVER_MODULE_PATH     := "/lib/modules/dhd.ko"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/bcm4329_sta.bin"
#WIFI_DRIVER_FW_AP_PATH      := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_NAME     :=  "dhd"
WIFI_DRIVER_MODULE_ARG      :=  "firmware_path=/system/etc/wifi/bcm4329_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt dhd_watchdog_ms=10 dhd_poll=1"

# kernel 
TARGET_PREBUILT_KERNEL := device/samsung/sidekick4g/kernel
BOARD_KERNEL_CMDLINE := console=ttyFIQ0 no_console_suspend
BOARD_KERNEL_BASE := 0x30000000
BOARD_PAGE_SIZE := 0x00001000
# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 7096912	
#0x006c4a50	#0x00380000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00480000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 392691712	
#0x17680000 	#392691712
# user data should be 0x20480000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 274464768	
#0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_PROVIDES_BOOTMODE := true

# recovery
TARGET_RECOVERY_INITRC := device/samsung/aries-common/recovery.rc
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/samsung/sidekick4g/recovery_ui.c
#TARGET_USERIMAGES_USE_EXT4 := true
BOARD_UMS_LUNFILE := /sys/devices/platform/s3c-usbgadget/gadget/lun0/file
BOARD_HAS_LARGE_FILESYSTEM := true

# Releasetools
#TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/samsung/aries-common/releasetools/aries_ota_from_target_files
#TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/samsung/aries-common/releasetools/aries_img_from_target_files
TARGET_CUSTOM_RELEASETOOL := ./device/samsung/sidekick4g/releasetools/squisher

# Camera
USE_CAMERA_STUB := false
BOARD_USE_FROYO_LIBCAMERA := true

# Audio
BOARD_USES_GENERIC_AUDIO := false
TARGET_PROVIDES_LIBAUDIO := true

# FM Radio
BOARD_HAVE_FM_RADIO := true
TARGET_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
TARGET_GLOBAL_CPPFLAGS += -DHAVE_FM_RADIO
BOARD_USE_BROADCOM_FM_VOLUME_HACK := true

# Graphics
BOARD_EGL_CFG := device/samsung/sidekick4g/egl.cfg
BOARD_NO_RGBX_8888 := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true

# Blue Tooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Mass Storage
BOARD_USE_USB_MASS_STORAGE_SWITCH := true

# GPS
BOARD_USES_GPSSHIM := true


