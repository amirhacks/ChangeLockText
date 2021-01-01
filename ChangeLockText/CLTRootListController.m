#include "CLTRootListController.h"
#import <UIKit/UIKit.h>

@implementation CLTRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

- (void)loadSpinner {
	UIActivityIndicatorView *progressWheel=[[UIActivityIndicatorView alloc]     initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	
	//makes activity indicator disappear when it is stopped
	progressWheel.hidesWhenStopped = YES;
  	//used to locate position of activity indicator
	progressWheel.center = CGPointMake(350, 166);
	[self.view addSubview: progressWheel];
	[progressWheel startAnimating];
	[progressWheel performSelector:@selector(stopAnimating) withObject:nil afterDelay:3.0];
	[progressWheel release];
}

- (void)_returnKeyPressed:(NSNotification *)settingschanged {
	[self loadSpinner];
	[self.view endEditing:YES];

}
-(void)twitter {
				[[UIApplication sharedApplication]
				openURL:[NSURL URLWithString:@"https://twitter.com/AmirHacKsIT"]
				options:@{}
				completionHandler:nil];
					}
					-(void)paypal {
						[[UIApplication sharedApplication]
						openURL:[NSURL URLWithString:@"https://paypal.me/AmirTamps/2"]
						options:@{}
						completionHandler:nil];

}

@end
