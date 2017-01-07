# Copyright 2014 The Android Open Source Project
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

include device/sony/rhine-common/PlatformConfig.mk
include device/sony/rhine-common/PlatformConfig2.mk

TARGET_BOOTLOADER_BOARD_NAME := D5503

BOARD_KERNEL_CMDLINE += androidboot.hardware=amami

# TWRP
TW_THEME := portrait_hdpi
TARGET_RECOVERY_FSTAB := device/sony/amami/recovery/root/etc/twrp.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_FLASH_FROM_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_BRIGHTNESS_PATH := /sys/class/leds/wled:backlight/brightness
TW_MAX_BRIGHTNESS := 255
