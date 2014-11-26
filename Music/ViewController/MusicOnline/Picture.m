//
//  Picture.m
//  Music
//
//  Created by 浩 郑 on 14-10-10.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import "Picture.h"

@implementation Picture

- (id)initWithImageView:(NSString *)imageView
{
    self = [super init];
    if (self) {
        self.imageView = imageView;
        
    }
    return self;
}

- (void)dealloc
{
    [_imageView release];
    [super dealloc];
}

@end
