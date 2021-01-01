ARCHS = armv7 armv7s arm64
TARGET = iphone::10.1:10.1
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ChangeLockText
ChangeLockText_FILES = CLTRootListController.m
ChangeLockText_INSTALL_PATH = /Library/PreferenceBundles
ChangeLockText_FRAMEWORKS = UIKit
ChangeLockText_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/ChangeLockText.plist$(ECHO_END)
