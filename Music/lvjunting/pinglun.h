//
//  pinglun.h
//  Music
//
//  Created by apple on 14-10-13.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pinglun : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)UITableView *tableview;
@property(nonatomic,retain)NSMutableArray *array;

@property(nonatomic,retain)NSString *ID;
@property(nonatomic,retain)NSMutableDictionary *dic1;
@property(nonatomic,retain)UIImage *beijing;
@end
