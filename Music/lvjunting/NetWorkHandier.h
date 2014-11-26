//
//  NetWorkHandier.h
//  Homework.9.16
//
//  Created by apple on 14-9-17.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkHandier : NSObject
+ (void)getConnectionWithURL:(NSString *)str comletion:(void(^)(id result))block;

@end
