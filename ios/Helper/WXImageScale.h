//
//  WXImageScale.h
//  RNWechat
//
//  Created by liudapeng on 2019/2/28.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FormatConversion.h"

NS_ASSUME_NONNULL_BEGIN

@interface WXImageScale : NSObject

+(NSData*)compressionImageByType:(NSString *)typeFor withImage:(UIImage *)image;

+(UIImage *)scalingAndCroppingForSize:(CGSize)targetSize withSourceImage:(UIImage *)sourceImage;

@end

NS_ASSUME_NONNULL_END
