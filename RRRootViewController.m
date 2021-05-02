#import "RRRootViewController.h"

@interface RRRootViewController ()
@end

@implementation RRRootViewController

- (void)trigger { 
	NSLog(@"Russian: done");
}

- (void)loadView {
	[super loadView];

	UIButton *trigger = [UIButton buttonWithType:UIButtonTypeCustom];
	[trigger addTarget:self action:@selector(trigger) forControlEvents:UIControlEventTouchUpInside];
	[trigger setTitle:@"Pull The Trigger" forState:UIControlStateNormal];
	[trigger sizeToFit];
	trigger.center = self.view.center;
	[self.view addSubview:trigger];
}

@end
