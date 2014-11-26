//
//  SecondTableViewCell.m
//  JBParallaxTable
//
//  Created by 浩 郑 on 14-10-1.
//  Copyright (c) 2014年 Javier Berlana. All rights reserved.
//

#import "SecondTableViewCell.h"
#import <ShareSDK/ShareSDK.h>

@implementation SecondTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(5, 10, 310, 130)];
        view.backgroundColor = [UIColor clearColor];
        view.layer.borderWidth = 1;
        view.layer.borderColor = [UIColor whiteColor].CGColor;
        view.layer.cornerRadius = 10;
//        view.alpha = 0.4;
        view.opaque = YES;
        [self.contentView addSubview:view];
        


        self.viewOfborder = [[UIView alloc] initWithFrame:CGRectMake(10, 20, 290, 60)];
//        self.viewOfborder.backgroundColor = [UIColor redColor];
        self.viewOfborder.layer.borderWidth = 1;
        self.viewOfborder.layer.cornerRadius = 5;
        self.viewOfborder.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [view addSubview:self.viewOfborder];
        
        self.titlelabel = [[UILabel alloc]init];
        self.titlelabel.backgroundColor = [UIColor clearColor];
        [view addSubview:self.titlelabel];
        [_titlelabel release];
        
        self.nickname = [[UILabel alloc]init];
        self.nickname.backgroundColor = [UIColor clearColor];
        [view addSubview:self.nickname];
        [_nickname release];
        
        self.playsCounts = [[UILabel alloc]init];
        self.playsCounts.backgroundColor = [UIColor clearColor];
        [view addSubview:self.playsCounts];
        [_playsCounts release];
        UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(26, 89, 12, 12)];
        image1.image = [UIImage imageNamed:@"101.png"];
        [view addSubview:image1];

        
        
        
        self.commentsCounts = [[UILabel alloc]init];
        self.commentsCounts.backgroundColor = [UIColor clearColor];
        [view addSubview:self.commentsCounts];
        [_commentsCounts release];
        UIImageView *image2 = [[UIImageView alloc] initWithFrame:CGRectMake(105, 89, 12, 12)];
        image2.image = [UIImage imageNamed:@"102.png"];
        [view addSubview:image2];

        
        self.sharesCounts = [[UILabel alloc]init];
        self.sharesCounts.backgroundColor = [UIColor clearColor];
        [view addSubview:self.sharesCounts];
        [_sharesCounts release];
        UIImageView *image3 = [[UIImageView alloc] initWithFrame:CGRectMake(165, 89, 12, 12)];
        image3.image = [UIImage imageNamed:@"103.png"];
        [view addSubview:image3];

        
        self.favoritesCounts =[[UILabel alloc]init];
        self.favoritesCounts.backgroundColor =[UIColor clearColor];
        [view addSubview:self.favoritesCounts];
        [_favoritesCounts release];
        UIImageView *image4 = [[UIImageView alloc] initWithFrame:CGRectMake(228, 89, 12, 12)];
        image4.image = [UIImage imageNamed:@"104.png"];
        [view addSubview:image4];

        
        self.coverSmall = [[UIImageView alloc]init];
        self.coverSmall.backgroundColor = [UIColor clearColor];
        [self.viewOfborder addSubview:_coverSmall];
        [_coverSmall release];
        
        
        self.goodButton = [[UIButton alloc]init];
        self.goodButton.backgroundColor = [UIColor whiteColor];
        [view addSubview:_goodButton];
        [_goodButton release];
        
        
        self.downLoadButton = [[UIButton alloc]init];
        self.downLoadButton.backgroundColor = [UIColor whiteColor];
        [view addSubview:_downLoadButton];
        [_downLoadButton release];
        
//        self.view = [[UIView alloc] init];
//        [self.contentView addSubview:self.view];
        
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
    
    self.view.frame = CGRectMake(30, 20, 280, 50);
//    self.view.backgroundColor = [UIColor redColor];
    self.view.layer.borderWidth = 0.5;
    self.view.layer.borderColor = [UIColor grayColor].CGColor;
    self.view.layer.cornerRadius = 5;

    self.goodButton.frame = CGRectMake(0, 110, 107, 20);
    self.goodButton.layer.cornerRadius = 10;
    [self.goodButton setTitle:@"收藏" forState:0];
    self.goodButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.goodButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.downLoadButton.frame = CGRectMake(203, 110, 107, 20);
    self.downLoadButton.layer.cornerRadius = 10;
    self.downLoadButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.downLoadButton addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    [self.downLoadButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.downLoadButton setTitle:@"分享" forState:0];
    
    
    self.coverSmall.frame = CGRectMake(230, 0, 60, 60);
    self.coverSmall.backgroundColor = [UIColor clearColor];
    self.coverSmall.layer.cornerRadius = 5;
    
    self.titlelabel.frame = CGRectMake(30, 30, 200, 18);
    self.titlelabel.textColor = [UIColor whiteColor];
    self.titlelabel.font = [UIFont systemFontOfSize:14];
//    self.title.text = @"姓名";

    self.nickname.frame = CGRectMake(40, 55, 150, 20);
//    self.nickname.text = @"专辑名";
    self.nickname.textColor = [UIColor whiteColor];
    self.nickname.font = [UIFont systemFontOfSize:11];
    
    self.playsCounts.frame = CGRectMake(40, 85, 50, 20);
//    self.playsCounts.text = @"播放次数";
    self.playsCounts.textColor = [UIColor whiteColor];
    self.playsCounts.font =[UIFont systemFontOfSize:10];
    
    
    
    self.commentsCounts.frame = CGRectMake(120, 85, 60, 20);
//    self.commentsCounts.text= @"关注";
    self.commentsCounts.textColor = [UIColor whiteColor];
    self.commentsCounts.font =[UIFont systemFontOfSize:10];
    self.sharesCounts.frame = CGRectMake(180, 85, 60, 20);
//    self.sharesCounts.text = @"评论";
    self.sharesCounts.textColor = [UIColor whiteColor];
    self.sharesCounts.font =[UIFont systemFontOfSize:10];
    self.favoritesCounts.frame = CGRectMake(240, 85, 60, 20);
//    self.favoritesCounts.text = @"下载";
    self.favoritesCounts.textColor = [UIColor whiteColor];
    self.favoritesCounts.font =[UIFont systemFontOfSize:10];
}

- (void)share:(UIButton *)button
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK"  ofType:@"jpg"];
    
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
                                       defaultContent:@"默认分享内容，没内容时显示"
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"ShareSDK"
                                                  url:@"http://www.sharesdk.cn"
                                          description:@"这是一条测试信息"
                                            mediaType:SSPublishContentMediaTypeNews];
    
    [ShareSDK showShareActionSheet:nil
                         shareList:nil
                           content:publishContent
                     statusBarTips:NO
                       authOptions:nil
                      shareOptions: nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSResponseStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
