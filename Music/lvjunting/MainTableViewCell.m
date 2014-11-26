//
//  MainTableViewCell.m
//  find
//
//  Created by 浩 郑 on 14-10-6.
//  Copyright (c) 2014年 浩 郑. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];
        
        self.pictImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.pictImageView];
        [_pictImageView release];
        
        self.nameLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel release];
        
        self.replyLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.replyLabel];
        [self.replyLabel release];
        
        self.timeLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.timeLabel];
        [self.timeLabel release];
        
        self.floorLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.floorLabel];
        [self.floorLabel release];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    

}

- (void)layoutSubviews
{
    // Initialization code
    [super layoutSubviews];
    self.pictImageView.frame = CGRectMake(10, 13, 60, 60);
    self.pictImageView.backgroundColor = [UIColor clearColor];
    self.pictImageView.layer.masksToBounds = YES;
    self.pictImageView.layer.cornerRadius = 30;
    self.pictImageView.layer.borderWidth = 2;
    self.pictImageView.layer.borderColor = [UIColor greenColor].CGColor;
//    self.pictImageView.layer.borderColor = [UIColor blackColor].CGColor;
    
    
    self.nameLabel.frame = CGRectMake(80, 13, 100, 20);
//    self.nameLabel.text = @"姓名";
    self.nameLabel.backgroundColor = [UIColor clearColor];
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    
    self.replyLabel.frame = CGRectMake(80, 40, 200, 30);
//    self.replyLabel.text = @"评论";
    self.replyLabel.font = [UIFont systemFontOfSize:13];
    self.replyLabel.backgroundColor = [UIColor clearColor];
    self.replyLabel.numberOfLines = 0;
    [self.replyLabel sizeToFit];
    
    
    self.timeLabel.frame = CGRectMake(250, 10, 30, 20);
//    self.timeLabel.text = @"时间";
    self.timeLabel.font = [UIFont systemFontOfSize:10];
    
    self.floorLabel.frame = CGRectMake(280, 10, 30, 20);
//    self.floorLabel.text = @"楼层";
    self.floorLabel.font = [UIFont systemFontOfSize:13];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
