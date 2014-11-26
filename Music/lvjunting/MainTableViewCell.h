//
//  MainTableViewCell.h
//  find
//
//  Created by 浩 郑 on 14-10-6.
//  Copyright (c) 2014年 浩 郑. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell

@property(nonatomic, retain)UIImageView *pictImageView;
@property(nonatomic, retain)UILabel *nameLabel;//名字
@property(nonatomic, retain)UILabel *replyLabel;//回复
@property(nonatomic, retain)UILabel *timeLabel;//评论时间
@property(nonatomic, retain)UILabel *floorLabel;//楼层


@end
