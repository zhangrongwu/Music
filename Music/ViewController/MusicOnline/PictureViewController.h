//
//  PictureViewController.h
//  Music
//
//  Created by 浩 郑 on 14-10-10.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureViewController : UIViewController

@property (nonatomic, copy)void(^block2)(NSString *string);
@property (nonatomic, retain)NSMutableArray *arr;

@end
