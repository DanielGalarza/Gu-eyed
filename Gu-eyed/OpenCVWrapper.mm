#include "OpenCVWrapper.h"
//#import "UIImage+OpenCV.h"

#include <opencv2/opencv.hpp>
#include <opencv2/imgcodecs/ios.h>

using namespace cv;
using namespace std;

@implementation OpenCVWrapper

+(NSString *) openCVVersionString {
    return [NSString stringWithFormat:@"Open CV Version: %s", CV_VERSION];
}

@end
