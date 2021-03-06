#include "OpenCVWrapper.h"
//#import "UIImage+OpenCV.h"

#import "FrameProcessor.h"
#import "VideoSource.h"

#ifdef __cplusplus
#include <opencv2/opencv.hpp>
#include <opencv2/imgcodecs/ios.h>
#endif

using namespace cv;
using namespace std;

@interface OpenCVWrapper ()
@property(nonatomic, strong)FrameProcessor *frameProcessor;
@property(nonatomic, strong)VideoSource *videoSource;
@end


@implementation OpenCVWrapper

+(NSString *) openCVVersionString {
    return [NSString stringWithFormat:@"Open CV Version: %s", CV_VERSION];
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _frameProcessor = [[FrameProcessor alloc] init];
        _videoSource = [[VideoSource alloc] init];
        _videoSource.delegate = _frameProcessor;
    }
    return self;
}

- (void)setTargetView:(UIView *)view {
    self.videoSource.targetView = view;
}

- (void)start {
    [self.videoSource start];
}

@end
