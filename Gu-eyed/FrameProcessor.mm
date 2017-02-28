//
//  FrameProcessor.m
//  MinimumOpenCVLiveCamera
//
//  Created by Akira Iwaya on 2015/11/05.
//  Copyright © 2015年 akira108. All rights reserved.
//

#import "FrameProcessor.h"

@implementation FrameProcessor

- (void)processFrame:(cv::Mat &)frame {
    // Convert to grayscale for Canny.
    cv::cvtColor(frame, frame, cv::COLOR_BGRA2GRAY);
    cv::Canny(frame, frame, 50, 150);
}

@end
