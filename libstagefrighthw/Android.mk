
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_SRC_FILES := NVOMXPlugin.cpp
LOCAL_C_INCLUDES += frameworks/native/include/media/hardware
LOCAL_C_INCLUDES += frameworks/native/include/media/openmax
LOCAL_SHARED_LIBRARIES := libutils libdl liblog
LOCAL_MODULE := libstagefrighthw
LOCAL_MULTILIB := 32
include $(BUILD_SHARED_LIBRARY)




