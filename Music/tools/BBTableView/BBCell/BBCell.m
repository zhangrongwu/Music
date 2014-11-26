//
//  BBCell.m
//  CircleView
//
//  Created by Bharath Booshan on 6/8/12.
//  Copyright (c) 2012 Bharath Booshan Inc. All rights reserved.
//

#import "BBCell.h"
@implementation BBCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //add the image layer
//        self.contentView.backgroundColor = [UIColor colorWithRed:0.63 green:0.17 blue:0.43 alpha:1];
        self.backgroundColor = [UIColor clearColor];
        mImageLayer =[CALayer layer];
        mImageLayer.cornerRadius = 16.0;
        mImageLayer.backgroundColor = [UIColor greenColor].CGColor;
      //  mImageLayer.contents = (id)[UIImage imageNamed:@"2.png"].CGImage;
        [self.contentView.layer addSublayer:mImageLayer];
        mImageLayer.borderWidth=4.0;
        mImageLayer.borderColor = [UIColor purpleColor].CGColor;
        //the title label
       mCellTtleLabel = [[UILabel alloc] initWithFrame:CGRectMake(44.0, 10.0, self.contentView.bounds.size.width - 44.0, 21.0)];
        [self.contentView addSubview:mCellTtleLabel];
        mCellTtleLabel.backgroundColor= [UIColor clearColor];
        mCellTtleLabel.textColor = [UIColor whiteColor];
        mCellTtleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.0];
//        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//        [center addObserver:self selector:@selector(suibian1:) name:@"主题1" object:nil];
//        [center addObserver:self selector:@selector(suibian2:) name:@"主题2" object:nil];
//        [center addObserver:self selector:@selector(suibian3:) name:@"主题3" object:nil];
//        [center addObserver:self selector:@selector(suibian4:) name:@"主题4" object:nil];
//        [center addObserver:self selector:@selector(suibian5:) name:@"主题5" object:nil];

       
    }
    return self;
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    float imageY = 4.0;
    float heightOfImageLayer  = self.bounds.size.height - imageY*2.0;
    heightOfImageLayer = floorf(heightOfImageLayer);
    mImageLayer.cornerRadius = heightOfImageLayer/2.0f;
    mImageLayer.frame = CGRectMake(4.0, imageY, heightOfImageLayer, heightOfImageLayer);
    mCellTtleLabel.frame = CGRectMake(heightOfImageLayer+10.0, floorf(heightOfImageLayer/2.0 - (21/2.0f))+4.0, self.contentView.bounds.size.width-heightOfImageLayer+10.0, 21.0);  
    
}

-(void)setCellTitle:(NSString*)title
{
    mCellTtleLabel.text = title;    
}

-(void)setIcon:(UIImage*)image
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:0];
    mImageLayer.contents = (id)image.CGImage;

    [CATransaction commit];
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    mImageLayer.borderColor = selected ? [UIColor orangeColor].CGColor : [UIColor whiteColor].CGColor;
    mCellTtleLabel.textColor = selected ? [UIColor orangeColor] : [UIColor whiteColor];
}


//- (void)suibian1:(NSNotification *)noti
//{
//    //    self.contentView.backgroundColor = ;
//    
//    //    UIView *view = [self.view viewWithTag:20];
//    //    UIView *view2 = [self.view viewWithTag:30];
//    self.contentView.backgroundColor = [UIColor colorWithRed:0.63 green:0.17 blue:0.43 alpha:1];
//    //    view2.backgroundColor = [UIColor colorWithRed:0.63 green:0.17 blue:0.43 alpha:1];
//    
//}
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
////    self.contentView.backgroundColor = [UIColor colorWithRed:0.50 green:0.82 blue:0.39 alpha:1];
//    self.contentView.backgroundColor = [UIColor orangeColor];
//    
//}
//- (void)suibian5:(NSNotification *)noti
//{
//    //    self.contentView.backgroundColor = ;
//    
//    self.contentView.backgroundColor = [UIColor blackColor];
//    
//}


@end
