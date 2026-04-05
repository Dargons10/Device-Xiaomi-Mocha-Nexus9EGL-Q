# Copyright (C) 2017 The Android Open Source Project
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

# Sets Android Go default values for properties specific for mocha

# Low RAM configuration
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true \
    persist.traced.enable=1

# LMK settings (less aggressive for 2GB RAM)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lmk.critical_upgrade=true \
    ro.lmk.upgrade_pressure=50 \
    ro.lmk.downgrade_pressure=70 \
    ro.lmk.medium=800 \
    ro.lmk.kill_heaviest_task=false \
    ro.statsd.enable=true

# Dalvik/ART heap tuning
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=192m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.7 \
    dalvik.vm.heapminfree=4m \
    dalvik.vm.heapmaxfree=16m

# Compiler and optimization settings
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true
PRODUCT_PROPERTY_OVERRIDES += \
    pm.dexopt.shared=quicken \
    pm.dexopt.downgrade_after_inactive_days=10

# Boot image profile
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt

# Network stack
PRODUCT_PACKAGES += InProcessNetworkStack

# Minimize debug info
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# madvise random in ART to reduce page cache thrashing.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.madvise-random=true

# ADB
PRODUCT_PROPERTY_OVERRIDES += \
  persist.service.adb.enable=1 \
  persist.service.debuggable=1 \
  persist.sys.usb.config=mtp,adb \
  persist.sys.root_access=2 \
  ro.secure=0 \
  ro.adb.secure=0 \
  ro.debuggable=1

# AptX
PRODUCT_PROPERTY_OVERRIDES += \
    persist.bt.enableAptXHD=true \
    persist.service.btui.use_aptx=1 \
    persist.vendor.bt.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac \
    persist.vendor.btstack.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldacs

# BT
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/vendor/etc/mocha_btmacaddr.txt

# DIDIM
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

# DIDIM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.tegra.didim.enable=1 \
    persist.tegra.didim.video=5 \
    persist.tegra.didim.normal=3

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Fastbootd
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fastbootd.available=true

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196609 \
    ro.sf.lcd_density=320 \
    persist.tegra.compositor=surfaceflinger \
    persist.tegra.decompression=cde-client \
    ro.surface_flinger.use_frame_rate_api=false \
    debug.sf.latch_unsignaled=1 \
    debug.sf.disable_backpressure=1 \
    ro.input.noresample=1 \
    ro.zygote.disable_gl_preload=true \
    persist.vendor.tegra.composite.policy=composite-yuv \
    debug.hwc.force_gpu=1 \
    persist.sys.ui.hw=false \
    debug.hwui.use_buffer_age=false \
    debug.hwui.renderer=opengl \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=2 \
    debug.sf.disable_hwc=1

# Lineage genuine
PRODUCT_PROPERTY_OVERRIDES += \
    persist.lineage.nofool=true

# OMX
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false \
    media.stagefright.less-secure=true \
    media.stagefright.legacyencoder=true

# PBC
PRODUCT_PROPERTY_OVERRIDES += \
   pbc.enabled=0 \
   pbc.log=0 \
   pbc.board_power_threshold=20000 \
   pbc.low_polling_freq_threshold=1000 \
   pbc.rails=cpu,core,dram,gpu \
   pbc.cpu.power=/sys/bus/i2c/devices/7-0045/power1_input \
   pbc.cpu.cap=/dev/cpu_freq_max \
   pbc.cpu.cap.af=/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies \
   pbc.core.power=/sys/bus/i2c/devices/7-0043/power1_input \
   pbc.dram.power=/sys/bus/i2c/devices/7-0049/power1_input \
   pbc.gpu.power=/sys/bus/i2c/devices/7-004b/power1_input \
   pbc.gpu.cap=/dev/gpu_freq_max \
   pbc.gpu.cap.af=/sys/devices/platform/host1x/gk20a.0/devfreq/gk20a.0/available_frequencies

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=yes
    
# Storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1 \
    wifi.interface=wlan0 \
    ap.interface=wlan0 \
    persist.tegra.nvmmlite=1 \
    persist.wlan.ti.calibrated=0
