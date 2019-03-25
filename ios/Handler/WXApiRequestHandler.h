#import "WXApiObject.h"

@interface WXApiRequestHandler : NSObject

+ (BOOL)sendAuthRequestScope:(NSString *)scope
                       State:(NSString *)state;

+ (BOOL)launchMiniProgramWithUserName:(NSString *)anUserName
                             path:(NSString *)aPath
                  miniProgramType:(WXMiniProgramType)aMiniProgramType;

+ (BOOL)sendText:(NSString *)text
         InScene:(enum WXScene)scene;

+ (BOOL)sendImage:(NSData *)anImageData
          InScene:(enum WXScene)aScene;

+ (BOOL)sendMusic:(NSString *)aMusicUrl
     musicDataUrl:(NSString *)aMusicDataUrl
            title:(NSString *)aTitle
      description:(NSString *)aDescription
       thumbImage:(NSData *)aThumbImageData
          InScene:(enum WXScene)aScene;

+ (BOOL)sendVideo:(NSString *)aVideoUrl
            title:(NSString *)aTitle
      description:(NSString *)aDescription
       thumbImage:(NSData *)aThumbImageData
          InScene:(enum WXScene)aScene;

+ (BOOL)sendLink:(NSString *)aLinkUrl
           title:(NSString *)aTitle
     description:(NSString *)aDescription
      thumbImage:(NSData *)aThumbImageData
         InScene:(enum WXScene)aScene;

+ (BOOL)sendMiniProgram:(NSString *)aUserName
        miniProgramType:(WXMiniProgramType)aMiniProgramType
                   path:(NSString *)aPath
           hdThumbImage:(NSData *)aHdThumbImageData
                  title:(NSString *)aTitle
            description:(NSString *)aDescription
             webpageUrl:(NSString *)aWebpageUrl
             thumbImage:(NSData *)aThumbImageData;
 
@end
