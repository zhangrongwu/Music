//
//  LeftViewController.h
//  Music
//
//  Created by lothario on 14-10-1.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Picture.h"

@protocol SecondPassValueDelegate <NSObject>

- (void)passPicture:(Picture *)pic;

@end

@interface LeftViewController : UIViewController

@property (nonatomic, retain)Picture *pic;


@property (nonatomic, retain) UIButton *one;
@property (nonatomic, retain) UIButton *two;
@property (nonatomic, retain) UIButton *three;
@property (nonatomic, retain) UIButton *four;



@property (nonatomic, retain)UIImageView *imageone;
@property (nonatomic, retain)UIImageView *imagetwo;
@property (nonatomic, retain)UIImageView *imagethree;
@property (nonatomic, retain)UIImageView *imagefour;


@property (nonatomic, retain)UIView *viewone;
@property (nonatomic, retain)UIView *viewtwo;
@property (nonatomic, retain)UIView *viewthree;
@property (nonatomic, retain)UIView *viewfour;


@property (nonatomic, retain)UIButton *zhuti;
@property (nonatomic, retain)UIButton *yellow;
@property (nonatomic, retain)UIButton *blue;
@property (nonatomic, retain)UIButton *red;
@property (nonatomic, retain)UIButton *green;
@property (nonatomic, retain)UIButton *black;
@property (nonatomic, retain)UIImageView *imagecolor;


@property (nonatomic, retain)UIView *yellowView;
@property (nonatomic, retain)UIView *blueView;
@property (nonatomic, retain)UIView *redView;
@property (nonatomic, retain)UIView *greenView;
@property (nonatomic, retain)UIView *blackView;


@property (nonatomic, assign)id <SecondPassValueDelegate> delegate;
@end
