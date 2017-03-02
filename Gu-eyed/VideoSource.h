//
//  VideoSource.h
//  MinimumOpenCVLiveCamera
//
//  Created by Akira Iwaya on 2015/11/05.
//  Copyright © 2015年 akira108. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifdef __cplusplus
#include <opencv2/opencv.hpp>
#endif

@protocol VideoSourceDelegate<NSObject>

- (void)cannyProcessFrame:(cv::Mat &)frame;
- (void)houghTransformProcessFrame:(cv::Mat &)frame;
- (void)houghTransformProbabilityProcessFrame:(cv::Mat &)frame;

@end

@interface VideoSource : NSObject

- (void)start;
- (void)stop;

@property(nonatomic, weak) id<VideoSourceDelegate> delegate;
@property(nonatomic, strong) UIView *targetView;

@end

