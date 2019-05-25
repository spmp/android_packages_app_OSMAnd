LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# Build etc. if BUILD_OSMAND defined
ifdef BUILD_OSMAND
$(info Building OSMAnd)
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE := OSMAnd

LOCAL_CERTIFICATE := platform

LOCAL_SRC_FILES := android/OsmAnd/build/outputs/apk/fullLegacyFat/debug/OsmAnd-full-legacy-fat-debug.apk

LOCAL_MODULE_CLASS := APPS
LOCAL_OVERRIDES_PACKAGES := Maps
LOCAL_PRIVILEGED_MODULE := true

LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

include $(BUILD_PREBUILT)

# Setup build environment
# Set TOPDIR if not already
ifdef TOPDIR
MY_TOPDIR := "$(TOPDIR)"
else
MY_TOPDIR := "$(shell pwd)"
endif

# Build defines
MY_JAVA_OPTIONS := -Xmx40960m

MY_BUILD_STATUS := $( shell _JAVA_OPTIONS=$(MY_JAVA_OPTIONS) ANDROID_HOME="$(MY_TOPDIR)/$(HISTORICAL_SDK_VERSIONS_ROOT)" JAVA_HOME="$(MY_TOPDIR)/$(ANDROID_JAVA8_HOME)" ./build-osm.sh 1>&2 2> /dev/null; echo $$?)
ifeq ($(MY_BUILD_STATUS),0)
$(error OSMAnd failed to build)
endif
else
$(info Not building OSMAnd)
endif
