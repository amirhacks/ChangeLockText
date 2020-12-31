#import <UIKit/UIKit.h>

static BOOL LCTisEnabled = YES;
static NSString* LCTtext = nil;

%hook SBUICallToActionLabel

static void loadPrefs()
{
	//TO DO
	//- change prefs objectForKey into the simplier
	//- check if stringValue works 
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.amirramos.pref.plist"];
	LCTisEnabled = [prefs objectForKey:@"LCTisEnabled"] ? [[prefs objectForKey:@"LCTisEnabled"] boolValue] : LCTisEnabled;
    LCTtext = [prefs objectForKey:@"LCTtext"] ? [prefs objectForKey:@"LCTtext"] : LCTtext;
}

- (void)setText:(id)arg1 forLanguage:(id)arg2 animated:(bool)arg3 {
	loadPrefs();
	if(LCTisEnabled && LCTtext){
    	NSString *customText = LCTtext;
		return %orig(customText, arg2, arg3);
    } else{
    	%orig;
    }
}

%end

%ctor 
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.amirramos.pref/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
}