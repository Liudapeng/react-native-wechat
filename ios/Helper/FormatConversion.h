#ifndef FormatConversion_h
#define FormatConversion_h

#import <UIKit/UIKit.h>

@interface FormatConversion : NSObject

+ (NSString *)typeForImageData:(NSData *)data;

+ (NSData *)stringToData:(NSString *)aString;

+ (NSData *)uiImageToData:(UIImage *)anUIImage;

+ (UIImage *)imageString:(NSString *)anImageUrlString toUIImageWithSize:(CGSize)aSize;

@end

#endif
