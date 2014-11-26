//
//  NetWorkHandier.m
//  Homework.9.16
//
//  Created by apple on 14-9-17.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "NetWorkHandier.h"

@implementation NetWorkHandier

+ (void)getConnectionWithURL:(NSString *)str comletion:(void(^)(id result))block
{
    //创建请求
    NSString *newStr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:newStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    request.HTTPMethod = @"get";
    
    //2.连接服务器
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //3.对结果进行处理
        
        if (data != nil) {
            id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            //解析之后的结果 通过block参数 使用
            block(result);
//            NSLog(@"==%@", connectionError);
            
        }
    }];
    
}

@end
