#import "FormatConversion.h"
//#define YFLog(format, ...) printf("class: < %s:(%d行) > method: %s \n%s\n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
@implementation FormatConversion


+ (NSString *)typeForImageData:(NSData *)data
{
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c)
    {
        case 0xFF:
            return @"image/jpg";
        case 0x89:
            return @"image/png";
        case 0x47:
            return @"image/gif";
        case 0x49:
        case 0x4D:
            return @"image/tiff";
    }
    return nil;
}

+ (NSData *)stringToData:(NSString *)aString
{
    NSURL *aUrl;
//    YFLog(@"dddd----->[1111]-----%@",aString);
    if ([self isPath:aString]) {
        aUrl = [NSURL fileURLWithPath:aString];
    } else {
        aUrl = [NSURL URLWithString:[aString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//      aUrl = [NSURL URLWithString:aString];
    }
//    YFLog(@"dddd----->[2222]-----%@",aUrl);
    
    return [NSData dataWithContentsOfURL:aUrl];
}

+ (NSData *)uiImageToData:(UIImage *)anUIImage
{
    if (anUIImage) {
        return UIImagePNGRepresentation(anUIImage);
    }
    return nil;
}

+ (UIImage *)imageString:(NSString *)anImageString toUIImageWithSize:(CGSize)aSize
{
    NSData *imageData = [self stringToData:anImageString];
    UIImage *image = nil;
    if (imageData != nil) {
        image = [self scaleImage:[UIImage imageWithData:imageData] toSize:aSize];
    }
    return image;
}

+ (BOOL)isPath:(NSString *)aString
{
    NSString *fullPath = aString.stringByStandardizingPath;
    return [fullPath hasPrefix:@"/"] || [fullPath hasPrefix:@"file:/"];
}

+ (UIImage *)scaleImage:(UIImage *)anImage toSize:(CGSize)aNewSize
{
    // UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(aNewSize, NO, 0.0);
    [anImage drawInRect:CGRectMake(0, 0, aNewSize.width, aNewSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
