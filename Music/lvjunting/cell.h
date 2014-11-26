//
//  cell.h
//  find
//
//  Created by apple on 14-9-30.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mp3PlayerButton.h"

@interface cell : UITableViewCell


@property(nonatomic, retain)UIImageView *cover_pathimage;//图片
@property(nonatomic, retain)UILabel *titlelabel;//主题
@property(nonatomic, retain)UILabel *nicknamelabel;//电台名
@property(nonatomic, retain)UILabel *count_playlabel;//播放过的次数
@property(nonatomic, retain)UILabel *count_likelabel;//赞过
@property(nonatomic, retain)Mp3PlayerButton *playButton;//播放键
@property(nonatomic, retain)UIImageView *player;//播放图标
@property(nonatomic, retain)UIImageView *nice;//赞图标
@property(nonatomic, retain)UILabel *count_commentlabel;//评论
@property(nonatomic, retain)UIImageView *speak;//评论

@property(nonatomic, retain)UILabel *wuyong;
@property(nonatomic, retain)UILabel *wuyong1;


@property(nonatomic, retain)UIView *view;
@property(nonatomic, retain)UIView *smallView;

@property(nonatomic, retain)UIImageView *dianjiliang;
@property(nonatomic, retain)UIImageView *zhuanji;
@end
