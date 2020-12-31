# TARGET = simulator:clang

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = changelocktext
//DEBUG=0
//FINALPACKAGE=1
changelocktext_FILES = Tweak.x
PreferenceLoader_FRAMEWORKS = UIKit SpringBoardUIServices


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += pref
include $(THEOS_MAKE_PATH)/aggregate.mk
