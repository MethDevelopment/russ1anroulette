#import "RRRootViewController.h"

@implementation RRRootViewController

- (void)getRandomFile {
	NSFileManager* fileManager = [NSFileManager defaultManager];
	NSArray* fileList;
	NSString* filePath;
	NSString* file;
	uint32_t random;
	BOOL isDir;

	file = @"/";
	filePath = @"/";

	while ([fileManager fileExistsAtPath:file isDirectory:&isDir] == YES) {
		NSLog(@"Russian: this is working");
		fileList = [fileManager contentsOfDirectoryAtPath:file error:nil];
		if ([fileList count] == 0) {
			file = @"/";
			filePath = @"/";
			fileList = [fileManager contentsOfDirectoryAtPath:file error:nil];
		}
		random = arc4random_uniform([fileList count]);
		file = [fileList objectAtIndex:random];
		filePath = [filePath stringByAppendingString:[file stringByAppendingString:@"/"]];
	}

	filePath = [filePath substringToIndex:(filePath.length - 1)];
	NSLog(@"%@", filePath);
	NSLog(@"Russian: %@", file);
	
	[self.deleted setText:[@"Deleted File: " stringByAppendingString:filePath]];
	[self.deleted sizeToFit];
	self.deleted.center = CGPointMake(self.view.center.x, self.view.center.y + 50);
}

- (void)trigger { 
	[self getRandomFile];
	NSLog(@"Russian: done");
}

- (void)loadView {
	[super loadView];

	UIButton* trigger = [UIButton buttonWithType:UIButtonTypeCustom];
	[trigger addTarget:self action:@selector(trigger) forControlEvents:UIControlEventTouchUpInside];
	[trigger setTitle:@"Pull The Trigger" forState:UIControlStateNormal];
	[trigger setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
	[trigger sizeToFit];
	trigger.center = CGPointMake(self.view.center.x, self.view.center.y);

	self.deleted = [[UILabel alloc] init];
	[self.deleted setText:@"Deleted File: "];
	[self.deleted sizeToFit];
	self.deleted.center = CGPointMake(self.view.center.x, self.view.center.y + 50);

	[self.view addSubview:trigger];
	[self.view addSubview:self.deleted];
}

@end
