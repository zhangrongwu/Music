//
//  ThreeViewController.h
//  find
//
//  Created by apple on 14-10-6.
//  Copyright (c) 2014年 apple. All rights reserved.
//
#import "Mp3PlayerButton.h"
#import "JingRoundView.h"
#import <UIKit/UIKit.h>
@class YDSlider;
@interface ThreeViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource, UITableViewDelegate,JingRoundViewDelegate>
@property(nonatomic,retain)NSString *mp3;
@property(nonatomic, assign)BOOL key;
@property(nonatomic, retain)UIScrollView *scrollView;

@property(nonatomic, retain)NSString *images;//网络获取
@property(nonatomic, retain)UIImageView *imageView;//大图
@property(nonatomic, retain)UIImageView *smallimageview;//小图
@property(nonatomic, retain)UILabel *nameLabel;
@property(nonatomic, retain)UILabel *musicLabel;
@property(nonatomic, retain)NSString *ID;

@property(nonatomic, retain)UITableView *tableView;

@property(nonatomic, retain)YDSlider *slider3;

@property(nonatomic, retain)Mp3PlayerButton *play;

@property(nonatomic, retain)NSMutableArray *array;//评论数组
@property(nonatomic,retain)NSMutableDictionary *dic1;//评论请求用字典
@property(nonatomic, retain)UIView *smallview;//具体图片  名称.....加在这个view上

@property (nonatomic,retain)JingRoundView *roundView;

@property (nonatomic,retain)UIButton *button;//下一曲
@property (nonatomic,assign)NSInteger count;//传的第几个
@property (nonatomic,retain)Mp3PlayerButton *play2;
@property (nonatomic,retain)Mp3PlayerButton *play3;
@property (nonatomic,retain)NSString *string;
@property (nonatomic,assign)NSInteger buttoncount;
@property (nonatomic,retain)NSString *mp3str;//mp3的下一首


@property (nonatomic, retain)NSArray *arrOfjiaodian;


@property (nonatomic, assign)NSInteger biaoji;
@property (nonatomic, assign)NSInteger mp3index;


@property(nonatomic, assign)NSInteger danlibiaoji;


@property (nonatomic, assign)NSInteger laiyuan;

@property (nonatomic, retain)JingRoundView *view1;



@property (nonatomic, assign)NSInteger temp;
@property (nonatomic, retain)NSMutableArray *arrrr;

//+ (ThreeViewController*) sharedInstance;
@end
