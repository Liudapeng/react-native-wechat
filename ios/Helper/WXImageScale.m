//
//  WXImageScale.m
//  RNWechat
//
//  Created by liudapeng on 2019/2/28.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "WXImageScale.h"

@implementation WXImageScale


+(NSData*)compressionImageByType:(NSString *)typeFor withImage:(UIImage *)image
{
    if(!image || !typeFor)
    {
        return nil;
    }
    
    if([typeFor isEqualToString:@"image/jpg"])
    {
        return UIImageJPEGRepresentation(image, 0.9);
    }
    else if([typeFor isEqualToString:@"image/png"])
    {
        return UIImagePNGRepresentation(image);
    }
    
    return nil;
}

/**
 *  图片裁剪到指定大小
 *  @param targetSize  目标图片的大小
 *  @param sourceImage 源图片
 *  @return 目标图片
 */
+(UIImage*)scalingAndCroppingForSize:(CGSize)targetSize withSourceImage:(UIImage *)sourceImage
{
    if(!sourceImage)
    {
        return sourceImage;
    }
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth= width * scaleFactor;
        scaledHeight = height * scaleFactor;
        // center the image
        //        if (widthFactor > heightFactor)
        //        {
        //            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        //        }
        //        else if (widthFactor < heightFactor)
        //        {
        //            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        //        }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width= scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
        NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    
    
    //    NSLog(@"scalingAndCroppingForSize: %f--%f--%f--%f",width,height, targetSize.width,targetSize.height);
    
    return newImage;
}

@end
