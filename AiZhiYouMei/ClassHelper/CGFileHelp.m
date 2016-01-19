//
//  CGFileHelp.m
//  AiZhiYouMei
//
//  Created by OSellMobile on 16/1/19.
//  Copyright © 2016年 CGMobile. All rights reserved.
//


#import "CGFileHelp.h"

@implementation CGFileHelp

+ (NSString *)createNewImagePath
{
    return [NSHomeDirectory() stringByAppendingFormat:@"%@IMG%ld.jpg", IMAGE_CACHE_PATH, (long)[[NSDate date] timeIntervalSince1970]];
}

+ (NSString *)createNewVoicePath
{
    return [NSHomeDirectory() stringByAppendingFormat:@"%@%ld.wav", VOICE_CACHE_PATH, (long)[[NSDate date] timeIntervalSince1970]];
}

+ (NSString *)createNewMp3VoicePath
{
    return [NSHomeDirectory() stringByAppendingFormat:@"%@%ld.wav", VOICE_CACHE_PATH, (long)[[NSDate date] timeIntervalSince1970]];
}

+ (NSString *)createNewVoiceAmrPath{
    return [NSHomeDirectory() stringByAppendingFormat:@"%@osell_%ld.amr", VOICE_CACHE_PATH, (long)[[NSDate date] timeIntervalSince1970]];
}

+ (NSString *)getImagePathWithUrl:(NSURL *)url
{
    NSString *path = [NSHomeDirectory() stringByAppendingFormat:@"%@%lu.jpg", IMAGE_CACHE_PATH, (unsigned long)url.description.hash];;
    return  path;
}

+ (NSString *)getVoicePathWithUrl:(NSURL *)url
{
    NSString *path = [NSHomeDirectory() stringByAppendingFormat:@"%@%lu.wav", VOICE_CACHE_PATH, (unsigned long)url.description.hash];;
    return  path;
}

+ (NSString *)getMp3VoicePathWithUrl:(NSURL *)url
{
    NSString *path = [NSHomeDirectory() stringByAppendingFormat:@"%@%lu.amr", VOICE_CACHE_PATH, (unsigned long)url.description.hash];;
    return  path;
}

@end
