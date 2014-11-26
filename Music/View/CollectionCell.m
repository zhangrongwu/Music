//
//  CollectionCell.m
//  Music
//
//  Created by lothario on 14-10-6.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.view = [[UIView alloc] init];
        [self.contentView addSubview:self.view];
        self.myImageView = [[UIImageView alloc] init];
        self.label = [[UILabel alloc] init];
        [self.contentView addSubview:self.myImageView];
        [self.contentView addSubview:self.label];
        
        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.view.frame = CGRectMake(10, 5, 245, 60);
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.layer.borderWidth = 0.5;
    self.view.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    self.view.layer.cornerRadius = 10;
    self.view.alpha = 0.3;
    
    
    self.myImageView.frame = CGRectMake(10, 5, 60, 60);
//    self.myImageView.layer.cornerRadius = 10;
    self.myImageView.layer.masksToBounds = YES;
//    self.myImageView.backgroundColor = [UIColor redColor];
    
    self.label.frame = CGRectMake(85, 5, 150, 60);
    self.label.font = [UIFont systemFontOfSize:14];
    self.label.textColor = [UIColor whiteColor];
    self.label.numberOfLines = 0;
//    self.label.backgroundColor = [UIColor yellowColor];
    
    
    
    
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
