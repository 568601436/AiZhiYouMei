//
//  RequestHelper.h
//  AiZhiYouMei
//
//  Created by OSellMobile on 16/1/6.
//  Copyright © 2016年 CGMobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config.h"
#import "ApiResult.h"

typedef void (^DoSuccessful)(id data);
typedef void (^DoFaild)();

@interface RequestHelper : NSObject

+ (NSString *)getBaseAdressWith:(NSString *)string;

+ (void)requestPOSTServer:(NSString *)address parameters:(NSObject*)parameters successful:(DoSuccessful)successful faild:(DoFaild)faild;

+ (void)requestGETTServer:(NSString *)address parameters:(NSObject*)parameters successful:(DoSuccessful)successful faild:(DoFaild)faild;

@end
