//
//  Music.h
//  find
//
//  Created by apple on 14-9-30.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Music : NSObject<NSCopying>



@property(nonatomic,retain)id cover_pathimage;//图片
@property(nonatomic,retain)NSString *titlelabel;//主题
@property(nonatomic,retain)NSString *nicknamelabel;//电台名
@property(nonatomic,retain)NSNumber *count_playlabel;//播放过的次数
@property(nonatomic,retain)NSNumber *count_likelabel;//赞过得
@property(nonatomic,retain)NSString *play_path_64music;//音乐
@property(nonatomic,retain)NSNumber *count_commentlabel;//评论
@property(nonatomic,retain)NSString *ID;//id传值
@property(nonatomic,retain)NSString *peopleName;//评论人的名字
@property(nonatomic,retain)NSString *content;//评论内容
@property(nonatomic,retain)id smallHeader;//评论人头像

- (id)initWithDictionary:(NSDictionary *)dic;
+ (NSMutableArray *)modelsFromDics:(NSArray *)arr;



+ (Music *)shareInstance;



@end
