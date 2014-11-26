//
//  TwoViewController.h
//  find
//
//  Created by apple on 14-9-30.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)NSMutableArray *array;
@property(nonatomic,retain)NSString *string;//网址

@property(nonatomic,retain)UIImageView *cover_pathimage;//照片

@property(nonatomic,retain)NSMutableDictionary *dic1;

@property(nonatomic,retain)UITableView *tableview;

@property(nonatomic,retain)NSString *musicStr;

@property(nonatomic, retain)NSString *nameOfType;



@property(nonatomic, assign)NSInteger biaoji;
@property(nonatomic, retain)NSMutableDictionary *dicOfType;


@property(nonatomic, retain)NSMutableArray *arrOfList;

@property(nonatomic, retain)UIView *topView;
@property(nonatomic, retain)NSMutableArray *arrID;
@end
