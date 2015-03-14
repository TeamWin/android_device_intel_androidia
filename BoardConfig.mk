USE_CAMERA_STUB := true

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := androidia

# Platform
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := sc1

# Architecture
TARGET_ARCH := x86
TARGET_CPU_ABI := x86
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := x86-atom
TARGET_ARCH_VARIANT_FPU := sse
TARGET_CPU_VARIANT := x86

BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_CMDLINE := loglevel=5 androidboot.hardware=baytrail_generic console=ttyS0,115200n8 androidboot.mode=main vga=current i915.modeset=1 drm.vblankoffdelay=1
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x11000000 --tags_offset 0x10000100 --dt device/intel/androidia/dt.img

BOARD_BOOTIMAGE_PARTITION_SIZE := 22020096
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 22020096
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_PREBUILT_KERNEL := device/intel/androidia/kernAl

# Recovery:Start

# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true

TARGET_USERIMAGES_USE_EXT4 := true

# TWRP specific build flags
DEVICE_RESOLUTION := 1920x1200
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_MTP := true
# This excludes parted from the build... parted is prebuilt and for arm CPU only
BOARD_HAS_NO_REAL_SDCARD := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TW_NO_SCREEN_TIMEOUT := true
TW_NO_USB_STORAGE := true
BOARD_CUSTOM_BOOTIMG_MK := device/intel/androidia/custombootimg.mk
