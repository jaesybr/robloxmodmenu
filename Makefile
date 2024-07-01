TARGET := iphone:clang:latest:12.2
INSTALL_TARGET_PROCESSES = com.roblox.robloxmobile


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RobloxModMenu

RobloxModMenu_FILES = $(shell find Sources/RobloxModMenu -name '*.swift') $(shell find Sources/RobloxModMenuC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
RobloxModMenu_SWIFTFLAGS = -ISources/RobloxModMenuC/include
RobloxModMenu_CFLAGS = -fobjc-arc -ISources/RobloxModMenuC/include

include $(THEOS_MAKE_PATH)/tweak.mk
