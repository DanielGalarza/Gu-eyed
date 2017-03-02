//
//  FrameProcessor.m
//  MinimumOpenCVLiveCamera
//
//

#import "FrameProcessor.h"

@implementation FrameProcessor

/* Canny Edge Detection Function */
- (void)cannyProcessFrame:(cv::Mat &)frame {
    // Convert to grayscale for Canny.
    cv::cvtColor(frame, frame, cv::COLOR_BGRA2GRAY);
    cv::Canny(frame, frame, 50, 150);
}//cannyProcessFrame


/* Hough Transform Original Function */
- (void)houghTransformProcessFrame:(cv::Mat &)frame {
    
    cv::Mat cannyEdges = frame;
    cv::Mat greyScaleImage = frame;
    
    // Convert to grayscale for Canny.
    cv::cvtColor(frame, greyScaleImage, cv::COLOR_BGRA2GRAY);
    cv::Canny(greyScaleImage, cannyEdges, 50, 150);

    std::vector<cv::Vec2f> lines;
    cv::HoughLines(cannyEdges, lines, 1, M_PI/180, 100);
    for( size_t i = 0; i < lines.size(); i++ ) {
        float rho = lines[i][0], theta = lines[i][1];
        cv::Point pt1, pt2;
        double a = cos(theta), b = sin(theta);
        double x0 = a*rho, y0 = b*rho;
        pt1.x = cvRound(x0 + 1000*(-b));
        pt1.y = cvRound(y0 + 1000*(a));
        pt2.x = cvRound(x0 - 1000*(-b));
        pt2.y = cvRound(y0 - 1000*(a));
        cv::line( frame, pt1, pt2, cv::Scalar(0,0,255), 3, CV_AA);
    }//for
}//houghTransformProcessFrame


/* Hough Transform Probability Function */
- (void)houghTransformProbabilityProcessFrame:(cv::Mat &)frame {
    
    cv::Mat cannyEdges = frame;
    cv::Mat greyScaleImage = frame;
    
    // Convert to grayscale for Canny.
    cv::cvtColor(frame, greyScaleImage, cv::COLOR_BGRA2GRAY);
    cv::Canny(greyScaleImage, cannyEdges, 50, 150);
    
    std::vector<cv::Vec4i> lines;
    cv::HoughLinesP(cannyEdges, lines, 1, CV_PI/180, 50, 50, 10 );
    for( size_t i = 0; i < lines.size(); i++ ) {
        cv::Vec4i l = lines[i];
        cv::line( frame, cv::Point(l[0], l[1]), cv::Point(l[2], l[3]), cv::Scalar(0,0,255), 3, cv::LINE_AA);
    }//for
}//houghTransformProbabilityProcessFrame

@end
