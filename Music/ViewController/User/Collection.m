//
//  Collection.m
//  Music
//
//  Created by lothario on 14-9-29.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import "Collection.h"
#import "CollectionCell.h"
#import "DataBaseHandler.h"
#import "NetworkHandler.h"
#import "UIImageView+WebCache.h"
#import <QuartzCore/QuartzCore.h>
#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "YRSideViewController.h"

#import <ShareSDK/ShareSDK.h>
#import <Parse/Parse.h>
#import "YRSideViewController.h"


@interface Collection ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain)UITableView *tableView;
@property (nonatomic, retain)NSArray *arr;


@property (nonatomic, retain)NSMutableArray *arrOfWebInformation;
@end

@implementation Collection

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.arr = [NSMutableArray array];

    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
        self.view.backgroundColor = [UIColor purpleColor];
        self.navigationController.navigationBarHidden = YES;
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:self.view.bounds];
        image.image = [UIImage imageNamed:@"pifu14.JPG"];
        image.userInteractionEnabled = YES;
        [self.view addSubview:image];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(160, 500, 30, 30);
        //    [button setTitle:@"清空" forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"shanchu.png"] forState:UIControlStateNormal];
        //    button.backgroundColor = [UIColor cyanColor];
        button.alpha = 0.7;
        button.layer.cornerRadius = 10;
        [button addTarget:self action:@selector(deleteDB:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(140, 10, 150, 80)];
        title.text = @"收藏";
        title.font = [UIFont systemFontOfSize:20];
        title.textColor = [UIColor whiteColor];
        [self.view addSubview:title];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(55, 70, 320, 420) style:UITableViewStylePlain];
        //    self.tableView.bounces = NO;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView setBackgroundColor:[UIColor clearColor]];
        self.tableView.rowHeight = 70;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //    [self.tableView setEditing:YES animated:YES];
        
        [self.view addSubview:self.tableView];
        [self.tableView registerClass:[CollectionCell class] forCellReuseIdentifier:@"reuse"];
        //    [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
        //        DataBaseHandler *dbHandler = [DataBaseHandler shareInstance];
        //        self.arr = [dbHandler selectAllStudents:[userInfo uid]];
        //
        //    }];
        
        //    [dbHandler closeDB];
        
        self.arrOfWebInformation = [[NSMutableArray alloc] init];
//        for (NSString *musicId in self.arr) {
//            NSString *str = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/track/detail?device=iPhone&trackId=%@", musicId];
////            NSLog(@"-------%@", musicId);
//            //        [self.arr addObject:str];
//            [NetworkHandler getConnectionWithURL:str completion:^(id result) {
//                [self.arrOfWebInformation addObject:result];
//                
//                //            NSLog(@"=================%@",[[self.arrOfWebInformation objectAtIndex:0] objectForKey:@"albumTitle"]);
//                [self.tableView reloadData];
//            }];
//        }
    
    
    
}

- (void)deleteDB:(UIButton *)button
{
    [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
        if (result) {
            
            DataBaseHandler *dbHandler = [DataBaseHandler shareInstance];
            [dbHandler deleteTable:[userInfo uid]];
        }
    }];

    
    
    [self.arrOfWebInformation removeAllObjects];
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if ([self.arrOfWebInformation count] < 6) {
        return 6;
    }else
    return [self.arrOfWebInformation count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.myImageView.image = nil;
    cell.label.text = nil;
    if (indexPath.row < [self.arrOfWebInformation count]) {
        [cell.myImageView setImageWithURL:[NSURL URLWithString:[[self.arrOfWebInformation objectAtIndex:indexPath.row] objectForKey:@"coverLarge"]]];
        cell.label.text = [[self.arrOfWebInformation objectAtIndex:indexPath.row] objectForKey:@"albumTitle"];
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"id");
    if (indexPath.row < self.arr.count) {
//        NSLog(@"----%@", self.arr);
        ThreeViewController *threeVC = [[ThreeViewController alloc] init];
        threeVC.ID = [self.arr objectAtIndex:indexPath.row];
        threeVC.arrOfjiaodian = self.arr;
        threeVC.mp3index = indexPath.row;
        threeVC.laiyuan = 110;
//        [self.navigationController pushViewController:threeVC animated:YES];
        [self presentViewController:threeVC animated:YES completion:^{

        }];
        [threeVC release];
    }

}

//图片变圆
-(UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset {
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset * 2.0f, image.size.height - inset * 2.0f);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
        if (result) {
            
            
            DataBaseHandler *dbHandler = [DataBaseHandler shareInstance];
            //        [dbHandler openDB];
            self.arr = [dbHandler selectAllStudents:[userInfo uid]];
//            NSLog(@"======%@", self.arr);
//            if (self.arr.count <= 6 ) {
//                self.tableView.scrollEnabled = NO;
//            } else{
//                self.tableView.scrollEnabled = YES;
//                self.tableView.bounces = NO;
//            }
            //    NSLog(@"==============%@",self.arr) ;
            self.arrOfWebInformation = [[NSMutableArray alloc] init];
            for (NSString *musicId in self.arr) {
                NSString *str = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/track/detail?device=iPhone&trackId=%@", musicId];
                //        [self.arr addObject:str];
//                NSLog(@"-------%@", musicId);

                [NetworkHandler getConnectionWithURL:str completion:^(id result) {
                    [self.arrOfWebInformation addObject:result];
                    
                    [self.tableView reloadData];
                }];
            }
        } else{
            NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
            
            [center postNotificationName:@"huifu" object:@"附带的参数" userInfo:nil];

        }
    }];

    
//    NSLog(@"%@", self.arr);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
