# ARCHS = x86_64
# TARGET = simulator:clang
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ChangeLockText
//DEBUG=0
//FINALPACKAGE=1
ChangeLockText_FILES = Tweak.x
PreferenceLoader_FRAMEWORKS = UIKit SpringBoardUIServices


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += ChangeLockText
include $(THEOS_MAKE_PATH)/aggregate.mk
