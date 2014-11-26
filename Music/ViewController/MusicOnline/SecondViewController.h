//
//  SecondViewController.h
//  JBParallaxTable
//
//  Created by 浩 郑 on 14-10-1.
//  Copyright (c) 2014年 Javier Berlana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain)NSMutableArray *arr;
@property (nonatomic, retain)UITableView *tableView;
@property (nonatomic, retain)NSNumber *idOfjiaodian;

@property (nonatomic, retain)NSNumber *idOfMusic;
@property (nonatomic, assign)NSInteger biaoji;

@property (nonatomic, assign)NSInteger collect;
@property (nonatomic, retain)NSDictionary *dicOfType;



@property (nonatomic, retain)NSMutableArray *arrOfID;
@end
