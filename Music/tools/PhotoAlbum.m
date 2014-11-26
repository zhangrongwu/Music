//
//  PhotoAlbum.m
//  相册封装
//
//  Created by lothario on 14-9-23.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import "PhotoAlbum.h"
#import "UIImageView+WebCache.h"
@interface PhotoAlbum ()
@property(nonatomic, retain)UIScrollView *scrollView;
@property(nonatomic, retain)UIPageControl *pageControl;
@property(nonatomic, retain)NSArray *array;
@property(nonatomic, assign)NSInteger tagOfAdress;
@property(nonatomic, assign)stypeOfPhotoAlbum stype;

@end


@implementation PhotoAlbum

- (id)initWithFrame:(CGRect)frame images:(NSArray *)images stype:(stypeOfPhotoAlbum)stype
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.stype = stype;
        self.tagOfAdress = 1;
        self.array = images;
        self.selectColor = [UIColor cyanColor];
        self.deSelectColor = [UIColor lightGrayColor];
        [self getPhotoAlbum];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame imagesWithUrl:(NSArray *)images stype:(stypeOfPhotoAlbum)stype
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.stype = stype;
        self.tagOfAdress = 2;
        self.array = images;
        self.selectColor = [UIColor cyanColor];
        self.deSelectColor = [UIColor lightGrayColor];
        [self getPhotoAlbum];
        
    }
    return self;
}

- (UIView *)getPhotoAlbum
{
    
    [self getScrollview];
    
    [self imagesFromView];
    
    [self getPageControl];
    
    return self;
}

- (void)getScrollview
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    if (self.stype == FromLeftToRight) {
        self.scrollView.contentSize = CGSizeMake(self.frame.size.width*([self.array count]+2), 0);
        self.scrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
    } else if (self.stype == FromUpToDown) {
        self.scrollView.contentSize = CGSizeMake(0, self.frame.size.height*([self.array count]+2));
        self.scrollView.contentOffset = CGPointMake(0, self.frame.size.height);
    }
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate = self;
        [self addSubview:self.scrollView];
        [self.scrollView release];

}


- (void)getPageControl
{
    if (self.stype == FromLeftToRight) {

        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height-10, self.frame.size.width, 10)];
        //设置白点数量
        self.pageControl.numberOfPages = [self.array count];
        self.pageControl.pageIndicatorTintColor = self.deSelectColor;//未选中颜色
        self.pageControl.currentPageIndicatorTintColor = self.selectColor;////选中颜色
        [self.pageControl addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:self.pageControl];
        [self.pageControl release];
    }
}

- (void)imagesFromView
{
    
//    UIScrollView *p1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//        p1.scrollEnabled = YES;
//        [self.scrollView addSubview:p1];
        UIImageView *f1 = [[UIImageView alloc] initWithFrame:self.bounds];
        
    if (self.tagOfAdress == 1) {
        f1.image = [UIImage imageNamed:[self.array lastObject]];
    } else if (self.tagOfAdress == 2) {
        [f1 setImageWithURL:[NSURL URLWithString:[self.array lastObject]]];
    }
    [self.scrollView addSubview:f1];
//        p1.delegate = self;
//        [p1 addSubview:f1];
//        p1.maximumZoomScale = 2.0;
//        p1.minimumZoomScale = 1;
//        p1.zoomScale = 1.0;//加载时候大小
//        [p1 release];
    
        for (int i = 0; i < [self.array count] + 1; i++) {
            
            UIScrollView *p = [[UIScrollView alloc] init];
            if (self.stype == FromLeftToRight) {

                p.frame = CGRectMake(self.frame.size.width + self.frame.size.width * i, 0, self.frame.size.width, self.frame.size.height);
            } else if (self.stype == FromUpToDown) {
                p.frame = CGRectMake(0, self.frame.size.height + self.frame.size.height * i, self.frame.size.width, self.frame.size.height);
            }
            p.tag = i+10;
            p.scrollEnabled = YES;
            [self.scrollView addSubview:p];
            UIImageView *f = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            
            if (i == [self.array count]) {
                if (self.tagOfAdress == 1) {
                    f.image = [UIImage imageNamed:[self.array firstObject]];
                } else if (self.tagOfAdress == 2) {
                    [f setImageWithURL:[NSURL URLWithString:[self.array firstObject]]];
                }
            } else if (i < [self.array count]) {
                if (1 == self.tagOfAdress) {
                    f.image = [UIImage imageNamed:[self.array objectAtIndex:i]];
                    NSLog(@"dsf");
                } else if (self.tagOfAdress == 2) {
                    [f setImageWithURL:[NSURL URLWithString:[self.array objectAtIndex:i]]];
                }
            }
            p.delegate = self;
            [p addSubview:f];
            p.maximumZoomScale = 2.0;
            p.minimumZoomScale = 1;
            p.zoomScale = 1.0;//加载时候大小
            [p release];
        }
    
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.scrollView) {
        int halfX = scrollView.frame.size.width / 2;
        _pageControl.currentPage = (scrollView.contentOffset.x - self.scrollView.bounds.size.width - halfX) / (scrollView.frame.size.width) + 1;
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    
    if (self.stype == FromLeftToRight) {

        int page = self.scrollView.contentOffset.x / scrollView.frame.size.width - 1;
        NSLog(@"page=%d", page);
        if (page == [self.array count]) {
            [_scrollView setContentOffset:CGPointMake(self.frame.size.width, 0)];
            _pageControl.currentPage = 0;
            
        }
        else if (page == -1) {
            [_scrollView setContentOffset:CGPointMake([self.array count]*self.frame.size.width, 0)];
            self.pageControl.currentPage = [self.array count];
            
        }
    } else if (self.stype == FromUpToDown) {
        int page = self.scrollView.contentOffset.y / scrollView.frame.size.height - 1;
        NSLog(@"page=%d", page);
        if (page == [self.array count]) {
            [_scrollView setContentOffset:CGPointMake(0,self.frame.size.height)];
            
        }
        else if (page == -1) {
            [_scrollView setContentOffset:CGPointMake(0, [self.array count]*self.frame.size.height)];
        }

    }

     //每次减速结束都让scollView所有的scrollView子视图缩放变为1
    for (UIScrollView * scrollv in scrollView.subviews) {
        if ([scrollv isKindOfClass:[UIScrollView class]]) {
            scrollv.zoomScale = 1.0;
        }
    }
    
}

- (void)pageAction:(UIPageControl *)pageControl
{
    
    [_scrollView setContentOffset:CGPointMake(self.frame.size.width * pageControl.currentPage, 0) animated:YES];
    
}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [scrollView.subviews firstObject];
}

- (void)setSelectColor:(UIColor *)selectColor
{
    self.pageControl.currentPageIndicatorTintColor = selectColor;
    if (_selectColor != selectColor) {
        [_selectColor release];
        _selectColor = [selectColor retain];
    }
    
}

- (void)setDeSelectColor:(UIColor *)deSelectColor
{
    self.pageControl.pageIndicatorTintColor = deSelectColor;
    if (_deSelectColor != deSelectColor) {
        [_deSelectColor release];
        _deSelectColor = [deSelectColor retain];
    }
}

- (void)setPoints:(BOOL)points
{
    if (points == NO) {
        self.pageControl.hidden = YES;
    }
}
- (void)setZoom:(BOOL)zoom
{
    if (zoom == YES) {
        self.scrollView.maximumZoomScale = 2.0;
        self.scrollView.minimumZoomScale = 0.5;
    } else {
        for (int i = 0; i < [self.array count]; i++) {
            UIScrollView *p = (UIScrollView *)[self.scrollView viewWithTag:10+i];
            p.maximumZoomScale = 1;
            p.minimumZoomScale = 1;
        }
    }
}

- (void)setAnimate:(NSTimeInterval)time
{
    self.pageControl.hidden = YES;
        [UIView animateWithDuration:15 animations:^{
            
            [UIView setAnimationRepeatAutoreverses:YES];//是否带反转
            [UIView setAnimationRepeatCount:NSIntegerMax];//循环次数(无限大)
            
            if (self.stype == FromLeftToRight) {
            self.scrollView.contentOffset = CGPointMake([self.array count]*self.frame.size.width, 0);
            } else if (self.stype == FromUpToDown) {
            self.scrollView.contentOffset = CGPointMake(0, [self.array count]*self.frame.size.height);
            }
        }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
