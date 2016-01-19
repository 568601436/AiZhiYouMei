//
//  CGFileHelp.h
//  AiZhiYouMei
//
//  Created by OSellMobile on 16/1/19.
//  Copyright © 2016年 CGMobile. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "Config.h"

@interface CGFileHelp : NSObject

+ (NSString *)getImagePathWithUrl:(NSURL *)url;
+ (NSString *)getVoicePathWithUrl:(NSURL *)url;
+ (NSString *)getMp3VoicePathWithUrl:(NSURL *)url;

+ (NSString *)createNewImagePath;
+ (NSString *)createNewVoicePath;
+ (NSString *)createNewMp3VoicePath;
+ (NSString *)createNewVoiceAmrPath;

@end
