//
//  NetworkHandler.h
//  封装类
//
//  Created by lothario on 14-9-17.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkHandler : NSObject
+ (void)getConnectionWithURL:(NSString *)str completion:(void(^)(id result))block;
@end
