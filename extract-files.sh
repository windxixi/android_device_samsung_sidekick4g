#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
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

DEVICE=sidekick4g
COMMON=sidekick4g
MANUFACTURER=samsung
mkdir -p ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
mkdir -p ../../../vendor/$MANUFACTURER/$COMMON/proprietary

# galaxysmtd
adb pull /system/etc/gps.conf ../../../$MANUFACTURER/$DEVICE/proprietary
adb pull /system/bin/agpsd ../../../$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libril.so ../../../$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libsecril-client.so ../../../$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libsec-ril.so ../../../$MANUFACTURER/$DEVICE/proprietary
adb pull /system/bin/rild ../../../$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libcamera.so ../../../$MANUFACTURER/$DEVICE/proprietary/libsamsungcamera.so 
adb pull /system/lib/librilswitch.so ../../../$MANUFACTURER/$DEVICE/proprietary/librilswitch.so 


# aries-common
adb pull /system/bin/pvrsrvinit ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/egl/libGLES_android.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/egl/libEGL_POWERVR_SGX540_120.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/egl/libGLESv2_POWERVR_SGX540_120.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/hw/gralloc.s5pc110.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libglslcompiler.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libIMGegl.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libpvr2d.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libpvrANDROID_WSEGL.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libPVRScopeServices.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libsrv_init.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libsrv_um.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libsensor_yamaha_test.so ../../../$MANUFACTURER/$COMMON/proprietary 
adb pull /system/lib/libsensorservice.so ../../../$MANUFACTURER/$COMMON/proprietary //нч
adb pull /system/lib/libActionShot.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libarccamera.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libcamera_client.so ../../../$MANUFACTURER/$COMMON/proprietar
adb pull /system/lib/libCaMotion.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libcaps.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libPanoraMax1.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libPlusMe.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libs3cjpeg.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libseccamera.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libseccameraadaptor.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libtvout.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libtvout_jni.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/lib_tvoutengine.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libtvoutfimc.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libtvouthdmi.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/lib/libtvoutservice.so ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/bin/tvoutserver ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/cameradata/datapattern_420sp.yuv ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/cameradata/datapattern_front_420sp.yuv ../../../$MANUFACTURER/$COMMON/proprietary
adb pull /system/bin/charging_mode ../../../$MANUFACTURER/$COMMON/proprietary/charging_mode
adb pull /system/bin/playlpm ../../../$MANUFACTURER/$COMMON/proprietary/playlpm
adb pull /system/lib/libQmageDecoder.so ../../../$MANUFACTURER/$COMMON/proprietary/libQmageDecoder.so
adb pull /system/media/battery_charging_10.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_10.qmg
adb pull /system/media/battery_charging_100.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_100.qmg
adb pull /system/media/battery_charging_15.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_15.qmg
adb pull /system/media/battery_charging_20.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_20.qmg
adb pull /system/media/battery_charging_25.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_25.qmg
adb pull /system/media/battery_charging_30.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_30.qmg
adb pull /system/media/battery_charging_35.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_35.qmg
adb pull /system/media/battery_charging_40.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_40.qmg
adb pull /system/media/battery_charging_45.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_45.qmg
adb pull /system/media/battery_charging_5.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_5.qmg
adb pull /system/media/battery_charging_50.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_50.qmg
adb pull /system/media/battery_charging_55.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_55.qmg
adb pull /system/media/battery_charging_60.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_60.qmg
adb pull /system/media/battery_charging_65.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_65.qmg
adb pull /system/media/battery_charging_70.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_70.qmg
adb pull /system/media/battery_charging_75.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_75.qmg
adb pull /system/media/battery_charging_80.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_80.qmg
adb pull /system/media/battery_charging_85.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_85.qmg
adb pull /system/media/battery_charging_90.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_90.qmg
adb pull /system/media/battery_charging_95.qmg ../../../$MANUFACTURER/$COMMON/proprietary/battery_charging_95.qmg
adb pull /system/media/chargingwarning.qmg ../../../$MANUFACTURER/$COMMON/proprietary/chargingwarning.qmg
adb pull /system/media/Disconnected.qmg ../../../$MANUFACTURER/$COMMON/proprietary/Disconnected.qmg

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g > ../../../$MANUFACTURER/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
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

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES := \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libril.so:obj/lib/libril.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsecril-client.so:obj/lib/libsecril-client.so


# All the blobs necessary for galaxys devices
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/gps.conf:system/etc/gps.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/agpsd:system/bin/agpsd \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/gps.aries.so:system/lib/hw/gps.aries.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libril.so:system/lib/libril.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsecril-client.so:system/lib/libsecril-client.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsec-ril.so:system/lib/libsec-ril.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/rild:system/bin/rild \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libcamera.so:system/lib/libsamsungcamera.so

EOF


(cat << EOF) | sed s/__COMMON__/$COMMON/g | sed s/__MANUFACTURER__/$MANUFACTURER/g > ../../../$MANUFACTURER/$COMMON/sidekick4g-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
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

# All the blobs necessary for galaxys devices
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/pvrsrvinit:system/bin/pvrsrvinit \\

    vendor/__MANUFACTURER__/__COMMON__/proprietary/libGLES_android.so:system/lib/egl/libGLES_android.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libEGL_POWERVR_SGX540_120.so:system/lib/egl/libEGL_POWERVR_SGX540_120.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libGLESv1_CM_POWERVR_SGX540_120.so:system/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libGLESv2_POWERVR_SGX540_120.so:system/lib/egl/libGLESv2_POWERVR_SGX540_120.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/gralloc.s5pc110.so:system/lib/hw/gralloc.s5pc110.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libglslcompiler.so:system/lib/libglslcompiler.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libIMGegl.so:system/lib/libIMGegl.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libpvr2d.so:system/lib/libpvr2d.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libpvrANDROID_WSEGL.so:system/lib/libpvrANDROID_WSEGL.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libPVRScopeServices.so:system/lib/libPVRScopeServices.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libsrv_init.so:system/lib/libsrv_init.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libsrv_um.so:system/lib/libsrv_um.so \\


# camera and tvout
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libActionShot.so:system/lib/libActionShot.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libarccamera.so:system/lib/libarccamera.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libcamera_client.so:system/lib/libcamera_client.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libcamerafirmwarejni.so:system/lib/libcamerafirmwarejni.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libCaMotion.so:system/lib/libCaMotion.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libcaps.so:system/lib/libcaps.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libPanoraMax1.so:system/lib/libPanoraMax1.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libPlusMe.so:system/lib/libPlusMe.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libs3cjpeg.so:system/lib/libs3cjpeg.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libseccamera.so:system/lib/libseccamera.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libseccameraadaptor.so:system/lib/libseccameraadaptor.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libsecjpegencoder.so:system/lib/libsecjpegencoder.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libtvout.so:system/lib/libtvout.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libtvout_jni.so:system/lib/libtvout_jni.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/lib_tvoutengine.so:system/lib/lib_tvoutengine.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libtvoutfimc.so:system/lib/libtvoutfimc.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libtvouthdmi.so:system/lib/libtvouthdmi.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libtvoutservice.so:system/lib/libtvoutservice.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/tvoutserver:system/bin/tvoutserver \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/datapattern_420sp.yuv:system/cameradata/datapattern_420sp.yuv \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/datapattern_front_420sp.yuv:system/cameradata/datapattern_front_420sp.yuv \\


# low power mode
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/charging_mode:system/bin/charging_mode \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/playlpm:system/bin/playlpm \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/libQmageDecoder.so:system/lib/libQmageDecoder.so \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_10.qmg:system/media/battery_charging_10.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_100.qmg:system/media/battery_charging_100.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_15.qmg:system/media/battery_charging_15.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_20.qmg:system/media/battery_charging_20.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_25.qmg:system/media/battery_charging_25.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_30.qmg:system/media/battery_charging_30.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_35.qmg:system/media/battery_charging_35.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_40.qmg:system/media/battery_charging_40.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_45.qmg:system/media/battery_charging_45.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_5.qmg:system/media/battery_charging_5.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_50.qmg:system/media/battery_charging_50.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_55.qmg:system/media/battery_charging_55.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_60.qmg:system/media/battery_charging_60.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_65.qmg:system/media/battery_charging_65.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_70.qmg:system/media/battery_charging_70.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_75.qmg:system/media/battery_charging_75.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_80.qmg:system/media/battery_charging_80.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_85.qmg:system/media/battery_charging_85.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_90.qmg:system/media/battery_charging_90.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/battery_charging_95.qmg:system/media/battery_charging_95.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/chargingwarning.qmg:system/media/chargingwarning.qmg \\
    vendor/__MANUFACTURER__/__COMMON__/proprietary/Disconnected.qmg:system/media/Disconnected.qmg
EOF

./setup-makefiles.sh
