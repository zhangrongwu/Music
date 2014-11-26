//
//  MyTableViewCell.m
//  JBParallaxTable
//
//  Created by 浩 郑 on 14-10-1.
//  Copyright (c) 2014年 Javier Berlana. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
//        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//        [center addObserver:self selector:@selector(suibian1:) name:@"主题1" object:nil];
//        [center addObserver:self selector:@selector(suibian2:) name:@"主题2" object:nil];
//        [center addObserver:self selector:@selector(suibian3:) name:@"主题3" object:nil];
//        [center addObserver:self selector:@selector(suibian4:) name:@"主题4" object:nil];
//        [center addObserver:self selector:@selector(suibian5:) name:@"主题5" object:nil];

        
        
//        self.contentView.backgroundColor = [UIColor blackColor];
        self.backgroundColor = [UIColor clearColor];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320 , 120)];
//        view.contentMode = UIViewContentModeScaleToFill;
        view.opaque = YES;
        view.clipsToBounds = YES;
        [self.contentView addSubview:view];
        
        self.myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -41, 320, 201)];
        self.myImageView.backgroundColor = [UIColor whiteColor];
        [view addSubview:self.myImageView];
        [_myImageView release];
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
        self.label.textColor = [UIColor whiteColor];
        self.label.textAlignment = NSTextAlignmentJustified;
        self.label.backgroundColor = [UIColor blackColor];
        self.label.alpha = 0.5;
        [self.contentView addSubview:self.label];
        
        
    }
    return self;
}

//- (void)suibian1:(NSNotification *)noti
//{
//    self.contentView.backgroundColor = [UIColor colorWithRed:0.63 green:0.17 blue:0.43 alpha:1];
//}
//
//- (void)suibian2:(NSNotification *)noti
//{
//    //    self.contentView.backgroundColor = ;
//    
//    self.contentView.backgroundColor = [UIColor colorWithRed:0.00 green:0.55 blue:0.78 alpha:1];
//    
//}
//- (void)suibian3:(NSNotification *)noti
//{
//    //    self.contentView.backgroundColor = ;
//    
//    self.contentView.backgroundColor = [UIColor colorWithRed:1.00 green:0.36 blue:0.39 alpha:1];
//    
//}
//- (void)suibian4:(NSNotification *)noti
//{
//    //    self.contentView.backgroundColor = ;
//    
//    self.contentView.backgroundColor = [UIColor colorWithRed:0.50 green:0.82 blue:0.39 alpha:1];
//    
//}
//- (void)suibian5:(NSNotification *)noti
//{
//    //    self.contentView.backgroundColor = ;
//    
//    self.contentView.backgroundColor = [UIColor blackColor];
//    
//}

- (void)awakeFromNib {
    // Initialization code
    
}

//- (void)layoutSubviews
//{
//    // Initialization code
//    [super layoutSubviews];
//    
//    
//    
////    //    self.myLabel.text = self.movie.title;
//    //[self.myImageView setImage:[UIImage imageNamed:self.movie.image]];
//    //    NSString *filePath = self.movie.image;
//    //    NSURL *url = [NSURL URLWithString:filePath];
//    //    [self.myImageView setImageWithURL:url];
////    self.myLabel.frame = CGRectMake(100, 0, 200, self.contentView.frame.size.height);
//}


- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view
{
    CGRect rectInSuperview = [tableView convertRect:self.frame toView:view];
    
    float distanceFromCenter = CGRectGetHeight(view.frame)/2 - CGRectGetMinY(rectInSuperview);
    float difference = CGRectGetHeight(self.myImageView.frame) - CGRectGetHeight(self.frame);
    float move = (distanceFromCenter / CGRectGetHeight(view.frame)) * difference;
    
    CGRect imageRect = self.myImageView.frame;
    imageRect.origin.y = -(difference/2)+move;
    self.myImageView.frame = imageRect;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
