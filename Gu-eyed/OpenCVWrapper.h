#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface OpenCVWrapper : NSObject

+ (NSString *) openCVVersionString;

- (void)setTargetView:(UIView *)view;
- (void)start;

@end
