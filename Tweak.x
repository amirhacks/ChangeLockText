#import <UIKit/UIKit.h>

static BOOL CLTisEnabled = YES;
static NSString* CLTtext = nil;

%hook SBUICallToActionLabel

static void loadPrefs()
{
	//TO DO
	//- change prefs objectForKey into the simplier
	//- check if stringValue works 
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.amirramos.changelocktext.plist"];
	CLTisEnabled = [prefs objectForKey:@"CLTisEnabled"] ? [[prefs objectForKey:@"CLTisEnabled"] boolValue] : CLTisEnabled;
    CLTtext = [prefs objectForKey:@"CLTtext"] ? [prefs objectForKey:@"CLTtext"] : CLTtext;
}

- (void)setText:(id)arg1 forLanguage:(id)arg2 animated:(bool)arg3 {
	loadPrefs();
	if(CLTisEnabled && CLTtext){
    	NSString *customText = CLTtext;
		return %orig(customText, arg2, arg3);
    } else{
    	%orig;
    }
}

%end

%ctor 
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.amirramos.changelocktext/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
}