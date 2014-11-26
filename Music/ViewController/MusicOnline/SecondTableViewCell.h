//
//  SecondTableViewCell.h
//  JBParallaxTable
//
//  Created by 浩 郑 on 14-10-1.
//  Copyright (c) 2014年 Javier Berlana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondTableViewCell : UITableViewCell

@property (nonatomic, retain)UILabel *titlelabel;
@property (nonatomic, retain)UILabel *nickname;
@property (nonatomic, retain)UILabel *playsCounts;
@property (nonatomic, retain)UILabel *commentsCounts;
@property (nonatomic, retain)UILabel *sharesCounts;
@property (nonatomic, retain)UILabel *favoritesCounts;

@property (nonatomic, retain)UIImageView *coverSmall;


@property (nonatomic, retain)UIButton *goodButton;
@property (nonatomic, retain)UIButton *downLoadButton;
@property(nonatomic, retain) UIView *view;


@property (nonatomic, retain)UIView *viewOfborder;
@end
