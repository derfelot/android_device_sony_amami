LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS 	:= eng
LOCAL_MODULE 		:= twrp.fstab
LOCAL_MODULE_CLASS 	:= ETC
LOCAL_SRC_FILES         := root/etc/twrp.fstab
LOCAL_MODULE_PATH       := $(TARGET_RECOVERY_ROOT_OUT)/etc
#create symlinks to enable access without system being mounted at recovery boot
LOCAL_POST_INSTALL_CMD	:= \
    mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/system; \
    mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/usr/share/zoneinfo; \
    ln -sfT /vendor $(TARGET_RECOVERY_ROOT_OUT)/system/vendor; \
    ln -sfT /etc $(TARGET_RECOVERY_ROOT_OUT)/system/etc; \
    ln -sfT /lib $(TARGET_RECOVERY_ROOT_OUT)/system/lib; \
    ln -sfT /bin $(TARGET_RECOVERY_ROOT_OUT)/system/bin; \
    ln -sfT /usr $(TARGET_RECOVERY_ROOT_OUT)/system/usr;

#build the hw keystore & copy neccessary files to ramdisk
LOCAL_ADDITIONAL_DEPENDENCIES += \
    keystore \
    keystore.$(TARGET_BOARD_PLATFORM)

LOCAL_POST_INSTALL_CMD += \
    mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/lib/hw ; \
    mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/bin ; \
    cp -u $(PRODUCT_OUT)/system/bin/keystore $(TARGET_RECOVERY_ROOT_OUT)/bin/keystore; \
    cp -u $(PRODUCT_OUT)/system/lib/libcutils.so $(TARGET_RECOVERY_ROOT_OUT)/lib/libcutils.so; \
    cp -u $(PRODUCT_OUT)/system/lib/libstdc++.so $(TARGET_RECOVERY_ROOT_OUT)/lib/libstdc++.so; \
    cp -u $(PRODUCT_OUT)/system/lib/libc.so $(TARGET_RECOVERY_ROOT_OUT)/lib/libc.so; \
    cp -u $(PRODUCT_OUT)/system/lib/hw/keystore.msm8974.so $(TARGET_RECOVERY_ROOT_OUT)/lib/hw/keystore.msm8974.so; \
    cp -u $(PRODUCT_OUT)/system/lib/libkeystore_binder.so $(TARGET_RECOVERY_ROOT_OUT)/lib/libkeystore_binder.so; \
    cp -u $(PRODUCT_OUT)/system/lib/libcrypto.so $(TARGET_RECOVERY_ROOT_OUT)/lib/libcrypto.so; \
    cp -u $(PRODUCT_OUT)/system/lib/libm.so $(TARGET_RECOVERY_ROOT_OUT)/lib/libm.so; \
    cp -u $(PRODUCT_OUT)/system/lib/libpcre.so $(TARGET_RECOVERY_ROOT_OUT)/lib/libpcre.so; \
    cp -u $(PRODUCT_OUT)/system/lib/libsoftkeymaster.so $(TARGET_RECOVERY_ROOT_OUT)/lib/libsoftkeymaster.so; \
    cp -u $(PRODUCT_OUT)/system/lib/libbinder.so $(TARGET_RECOVERY_ROOT_OUT)/lib/libbinder.so; \
    cp -u $(PRODUCT_OUT)/system/lib/libhardware.so $(TARGET_RECOVERY_ROOT_OUT)/lib/libhardware.so; \
    cp -u $(PRODUCT_OUT)/system/lib/libutils.so $(TARGET_RECOVERY_ROOT_OUT)/lib/libutils.so; \
    cp -u $(PRODUCT_OUT)/system/lib/libdl.so $(TARGET_RECOVERY_ROOT_OUT)/lib/libdl.so; \
    cp -u $(PRODUCT_OUT)/system/lib/libunwind.so $(TARGET_RECOVERY_ROOT_OUT)/lib/libunwind.so; \
    cp -u $(PRODUCT_OUT)/system/usr/share/zoneinfo/tzdata $(TARGET_RECOVERY_ROOT_OUT)/usr/share/zoneinfo/tzdata;

LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_PREBUILT)
