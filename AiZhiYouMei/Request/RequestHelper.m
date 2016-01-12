//
//  RequestHelper.m
//  AiZhiYouMei
//
//  Created by OSellMobile on 16/1/6.
//  Copyright © 2016年 CGMobile. All rights reserved.
//

#import "RequestHelper.h"



@implementation RequestHelper

+ (NSString *)getBaseAdressWith:(NSString *)string{
    return [SERVER_BASE_URL stringByAppendingString:string];
}

+ (void)requestPOSTServer:(NSString *)address parameters:(NSObject*)parameters successful:(DoSuccessful)successful faild:(DoFaild)faild{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    [manager POST:address parameters:parameters constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        ApiResult *result = nil;
        NSError *error=nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData: responseObject options: NSJSONReadingMutableLeaves error: &error];
        if (!error)
        {
            
            NSDictionary *state = [json objectForKey: @"state"];
            
            if (state)
            {
                int code = [[state objectForKey: @"code"] intValue];
                result = [[ApiResult alloc] init];
                
                if (code == 0)
                {
                    result.Data = [json objectForKey: @"data"];
                    successful(result.Data);
                }
                else
                {
                    result.Error = [state objectForKey: @"errorMsg"];
                    NSLog(@"%@",result.Error);
                }
            }
            
        }
        else
        {
//            result = [[ApiResult alloc] init];
//            result.Error = @"连接服务器失败";
            NSLog(@"连接服务器失败");
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        faild();
    }];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
}

+ (void)requestGETTServer:(NSString *)address parameters:(NSObject*)parameters successful:(DoSuccessful)successful faild:(DoFaild)faild{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    [manager GET:address parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successful(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        faild();
    }];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
}


+ (ApiResult *)handleOEDAction:(NSData *)data error:(NSError *)error
{
    ApiResult *result = nil;
    
    if (!error)
    {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableLeaves error: &error];
        
        if (!error)
        {
            
            NSDictionary *state = [json objectForKey: @"state"];
            
            if (state)
            {
                int code = [[state objectForKey: @"code"] intValue];
                result = [[ApiResult alloc] init];
                
                if (code == 0)
                {
                    result.Data = [json objectForKey: @"data"];
                }
                else
                {
                    result.Error = [state objectForKey: @"errorMsg"];
                }
            }
            
        }
        else
        {
            result = [[ApiResult alloc] init];
            result.Error = @"连接服务器失败";
        }
    }
    else
    {
        result = [[ApiResult alloc] init];
        result.Error = @"连接服务器失败";
    }
    
    return result;
}

@end
