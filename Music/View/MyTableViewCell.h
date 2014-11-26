//
//  MyTableViewCell.h
//  JBParallaxTable
//
//  Created by 浩 郑 on 14-10-1.
//  Copyright (c) 2014年 Javier Berlana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (nonatomic, retain)UIImageView *myImageView;
@property(nonatomic, retain)UILabel *label;

- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view;
@end
