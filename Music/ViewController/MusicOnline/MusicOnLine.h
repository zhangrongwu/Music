//
//  MusicOnLine.h
//  Music
//
//  Created by lothario on 14-9-29.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAIntroView.h"

@interface MusicOnLine : UIViewController<UIScrollViewDelegate, UIGestureRecognizerDelegate, EAIntroDelegate>


@property (nonatomic, retain)NSMutableArray *arrOfId;
@property (nonatomic, retain)UIImageView *view001;


@property (nonatomic, retain)UIImageView *backimagepaihang;

@property (nonatomic, retain)UIImageView *kaiji;
@end
