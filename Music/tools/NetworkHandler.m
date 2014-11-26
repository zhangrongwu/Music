//
//  NetworkHandler.m
//  封装类
//
//  Created by lothario on 14-9-17.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import "NetworkHandler.h"

@implementation NetworkHandler
+ (void)getConnectionWithURL:(NSString *)str completion:(void(^)(id result))block
{
    //1.创建请求
    NSString *newStr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:newStr];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    request.HTTPMethod = @"GET";
    
    //2.连接服务器
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        //3.对结果进行处理
        if (data != nil) {
            
            id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            //解析之后结果 通过block参数  使用
            
            block(result);
            
        }
    }];
}
@end
