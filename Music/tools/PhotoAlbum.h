//
//  PhotoAlbum.h
//  相册封装
//
//  Created by lothario on 14-9-23.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, stypeOfPhotoAlbum) {
    FromLeftToRight = 1,
    FromUpToDown = 2
};

@interface PhotoAlbum : UIView<UIScrollViewDelegate>

@property(nonatomic, retain)UIColor *selectColor;//选中颜色
@property(nonatomic, retain)UIColor *deSelectColor;//未选中颜色
@property(nonatomic, assign)BOOL points; //default is YES:
@property(nonatomic, assign)BOOL zoom; //放大缩小

- (id)initWithFrame:(CGRect)frame images:(NSArray *)images stype:(stypeOfPhotoAlbum)stype;
- (id)initWithFrame:(CGRect)frame imagesWithUrl:(NSArray *)images stype:(stypeOfPhotoAlbum)stype;
- (void)setAnimate:(NSTimeInterval)time;
@end
