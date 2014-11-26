//
//  AppDelegate.h
//  Music
//
//  Created by lothario on 14-9-29.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YRSideViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *viewController;

@property (nonatomic, retain)YRSideViewController *ChouTi;
@end
