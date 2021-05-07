TARGET := iphone:clang:latest:13.0
INSTALL_TARGET_PROCESSES = russ1anroulette

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = russ1anroulette

russ1anroulette_FILES = main.m RRAppDelegate.m RRRootViewController.m
russ1anroulette_FRAMEWORKS = UIKit CoreGraphics Foundation
russ1anroulette_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/application.mk
