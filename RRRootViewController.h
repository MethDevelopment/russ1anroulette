#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface RRRootViewController : UIViewController
@property (nonatomic, strong) UILabel *deleted;

- (void)trigger;
- (void)loadView;
- (void)getRandomFile;
@end
