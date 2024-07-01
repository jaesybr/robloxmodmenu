TARGET := iphone:clang:latest:18.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RobloxModMenu

RobloxModMenu_FILES = $(wildcard Sources/RobloxModMenu/*.swift) \
                      $(wildcard Sources/RobloxModMenuC/*.m) \
                      $(wildcard Sources/RobloxModMenuC/*.c) \
                      $(wildcard Sources/RobloxModMenuC/*.mm) \
                      $(wildcard Sources/RobloxModMenuC/*.cpp)

RobloxModMenu_SWIFTFLAGS = -ISources/RobloxModMenuC/include
RobloxModMenu_CFLAGS = -fobjc-arc -ISources/RobloxModMenuC/include

include $(THEOS_MAKE_PATH)/tweak.mk
