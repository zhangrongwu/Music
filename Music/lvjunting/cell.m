//
//  cell.m
//  find
//
//  Created by apple on 14-9-30.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "cell.h"
#import <QuartzCore/QuartzCore.h>
#import "Mp3PlayerButton.h"

@implementation cell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
//        self.cover_pathimage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1.jpeg"]];
        //黑边
        self.backgroundColor =  [UIColor clearColor];
        
        
        self.view = [[UIView alloc] init];
        self.view.layer.masksToBounds = YES;
        self.view.layer.cornerRadius = 6.0;
        self.view.layer.borderWidth = 1.0;
        self.view.backgroundColor = [UIColor clearColor];
        self.view.layer.borderColor = [[UIColor whiteColor] CGColor];
        [self.contentView addSubview:self.view];
        
        self.smallView = [[UIView alloc]init];
        self.smallView.layer.masksToBounds = YES;
        self.smallView.layer.cornerRadius = 6.0;
        self.smallView.backgroundColor = [UIColor clearColor];
        self.smallView.layer.borderWidth = 1.0;
        self.smallView.layer.borderColor = [[UIColor whiteColor]CGColor];
        [self.view addSubview:self.smallView];
        
        
        self.dianjiliang = [[UIImageView alloc] init];
        [self.view addSubview:self.dianjiliang];
        
        self.zhuanji = [[UIImageView alloc] init];
        [self.view addSubview:self.zhuanji];
        
        self.cover_pathimage = [[UIImageView alloc]init];
        self.cover_pathimage.backgroundColor = [UIColor clearColor];
        self.cover_pathimage.layer.masksToBounds = YES;
        self.cover_pathimage.layer.cornerRadius = 6.0;
        self.cover_pathimage.layer.borderWidth = 1.0;
        [self.smallView addSubview:self.cover_pathimage];
        [self.cover_pathimage release];
        
//        @property(nonatomic,retain)UILabel *titlelabel;//主题
        self.titlelabel = [[UILabel alloc]init];
        self.titlelabel.backgroundColor = [UIColor clearColor];
        [self.titlelabel setTextColor:[UIColor whiteColor]];
        [self.smallView addSubview:self.titlelabel];
        [self.titlelabel release];
//        @property(nonatomic,retain)UILabel *nicknamelabel;//电台名
        self.nicknamelabel = [[UILabel alloc]init];
        [self.nicknamelabel setTextColor:[UIColor whiteColor ]];
        [self.smallView addSubview:self.nicknamelabel];
        [self.nicknamelabel release];
//        @property(nonatomic,retain)UILabel *count_playlabel;//播放过的次数
        self.count_playlabel = [[UILabel alloc]init];
        self.count_playlabel.backgroundColor = [UIColor clearColor];
        [self.count_playlabel setTextColor:[UIColor whiteColor]];
        [self.view addSubview:self.count_playlabel];
        [self.count_playlabel release];
//        @property(nonatomic,retain)UILabel *count_likelabel;//赞过得
        self.count_likelabel = [[UILabel alloc]init];
        self.count_likelabel.backgroundColor = [UIColor blackColor];
        [self.count_likelabel setTextColor:[UIColor blackColor]];
        
//        self.count_likelabel.layer.borderColor = [UIColor whiteColor].CGColor;
//        self.count_likelabel.layer.borderWidth = 1.0;

        [self.view addSubview:self.count_likelabel];
        [self.count_likelabel release];
        
        //播放按钮
        self.playButton = [[Mp3PlayerButton alloc]init];
        self.playButton.backgroundColor =[UIColor clearColor];
        [self.smallView addSubview:self.playButton];
        [self.playButton release];
        
        //播放图标
        self.player = [[UIImageView alloc]init];
        self.player.backgroundColor = [UIColor clearColor];
        [self.view addSubview:self.player];
        [self.player release];
        
        //点赞图标
        self.nice = [[UIImageView alloc]init];
       self.nice.backgroundColor = [UIColor clearColor];
        [self.view addSubview:self.nice];
        [self.nice release];
        
        
        self.speak = [[UIImageView alloc]init];
        self.speak.backgroundColor = [UIColor clearColor];
        [self.view addSubview:self.speak];
        [self.speak release];
        
        self.count_commentlabel = [[UILabel alloc]init];
        self.count_commentlabel.backgroundColor = [UIColor clearColor];
            [self.count_commentlabel setTextColor:[UIColor whiteColor]];
        [self.view addSubview:self.count_commentlabel];
        [self.count_commentlabel release];
        
        
        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
//    CGFloat x = self.contentView.frame.size.width;
//    CGFloat y = self.contentView.frame.size.height - 10;
//    self.cover_pathimage.frame = CGRectMake(0, 0, y, y);
//    self.titlelabel.frame = CGRectMake(y, 0, x - y, y / 3);
//    self.nicknamelabel.frame = CGRectMake( y, y * 17 / 27, x - y, y / 6);
//    self.count_playlabel.frame = CGRectMake(y, y * 5 / 6 , (x - y) / 2, y / 6);
//    self.count_likelabel.frame = CGRectMake(y + ((x - y) / 2) + 10, y * 5 / 6, (x - y) / 2, y / 6);
//    self.playButton.frame = CGRectMake(y / 3, y / 3, y / 3, y / 3);
////    self.wuyong.frame = CGRectMake(y, y * 8 / 27, x - y , y / 3);
////    self.wuyong1.frame = CGRectMake(y, y * 129 / 162, x - y, y * 6 / 162);
    self.view.frame = CGRectMake(2, 5, 316, 110);
//    self.view.backgroundColor = [UIColor clearColor];
    
    self.smallView.frame = CGRectMake(10, 10, 300, 80);
    
    self.cover_pathimage.frame = CGRectMake(0, 0, 80, 80);
//    self.cover_pathimage.image = [UIImage imageNamed:@"zhanwei.png"];
    
    self.titlelabel.frame = CGRectMake(93, 5, 220, 50);
    self.titlelabel.font = [UIFont systemFontOfSize:15];
    self.titlelabel.numberOfLines = 0;
//    [self.titlelabel sizeToFit];
    
    self.nicknamelabel.frame =  CGRectMake(105, 40, 200, 40);
    self.nicknamelabel.font = [UIFont systemFontOfSize:13];
    self.nicknamelabel.backgroundColor = [UIColor clearColor];
    
    self.zhuanji.frame = CGRectMake(280, 60, 25, 25);
//    self.zhuanji.backgroundColor = [UIColor redColor];
    
    
    
    self.count_likelabel.frame = CGRectMake(158, 91, 80, 20);
      self.count_likelabel.font = [UIFont systemFontOfSize:10];
    [self.count_likelabel setTextColor:[UIColor whiteColor]];
    self.count_likelabel.backgroundColor = [UIColor clearColor];
    self.count_playlabel.frame = CGRectMake(253, 91, 80, 20);
      self.count_playlabel.font = [UIFont systemFontOfSize:10];
    self.count_playlabel.backgroundColor = [UIColor clearColor];
    
    self.playButton.frame = CGRectMake(25, 25, 30, 30);
    
    self.player.frame = CGRectMake(140, 95, 12, 12);
    self.nice.frame = CGRectMake(235, 93, 13, 13);
    self.dianjiliang.frame = CGRectMake(100, 63, 12, 12);
//    self.dianjiliang.backgroundColor = [UIColor redColor];
    
    self.speak.frame = CGRectMake(40, 92, 16, 17);
    self.count_commentlabel.frame = CGRectMake(58, 91, 70, 20);
    self.count_commentlabel.font = [UIFont systemFontOfSize:10];
    
    
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
