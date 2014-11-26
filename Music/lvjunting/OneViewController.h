//
//  OneViewController.h
//  find
//
//  Created by apple on 14-9-30.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CloudView.h"
@interface OneViewController : UIViewController
@property(nonatomic,retain)NSString *str;
@property(nonatomic,retain)NSMutableDictionary *dic;
@property(nonatomic,retain)NSMutableArray *arr;
@property(nonatomic, retain)CloudView *cv;
@end
