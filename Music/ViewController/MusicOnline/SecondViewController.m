//
//  SecondViewController.m
//  JBParallaxTable
//
//  Created by 浩 郑 on 14-10-1.
//  Copyright (c) 2014年 Javier Berlana. All rights reserved.
//

#import "SecondViewController.h"
#import "MyTableViewCell.h"
#import "SecondTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "DataBaseHandler.h"

#import "CExpandHeader.h"

#import "DXAlertView.h"

#import <ShareSDK/ShareSDK.h>
#import <Parse/Parse.h>

#import "FXBlurView.h"

#import "ThreeViewController.h"
#import "NetWorkHandier.h"
#import "MONActivityIndicatorView.h"


@interface SecondViewController ()
@property(nonatomic, retain)UIImageView *imageFromWeb;
@property(nonatomic, retain)NSMutableArray *array;
@property(nonatomic, retain)NSMutableDictionary *dictionary;
@property(nonatomic, retain)UIImageView *backimage;
@property(nonatomic, retain)UIButton *jiazai;
@end

@implementation SecondViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.arr = [[NSMutableArray alloc]init];
        self.idOfMusic = [[NSNumber alloc] init];
        self.dicOfType = [NSDictionary dictionary];
        self.arrOfID = [NSMutableArray array];
        self.backimage = [[UIImageView alloc] init];
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self selector:@selector(suibian1:) name:@"主题1" object:nil];
        [center addObserver:self selector:@selector(suibian2:) name:@"主题2" object:nil];
        [center addObserver:self selector:@selector(suibian3:) name:@"主题3" object:nil];
        [center addObserver:self selector:@selector(suibian4:) name:@"主题4" object:nil];
        [center addObserver:self selector:@selector(suibian5:) name:@"主题5" object:nil];
//        [center release];
    }
    return self;
}
- (void)suibian1:(NSNotification *)noti
{
    //    self.contentView.backgroundColor = ;
    
    //    UIView *view = [self.view viewWithTag:20];
    //    UIView *view2 = [self.view viewWithTag:30];
    self.backimage.image = nil;
    self.view.backgroundColor = [UIColor colorWithRed:0.63 green:0.17 blue:0.43 alpha:1];
    //    view2.backgroundColor = [UIColor colorWithRed:0.63 green:0.17 blue:0.43 alpha:1];
    
}
- (void)suibian2:(NSNotification *)noti
{
    //    self.contentView.backgroundColor = ;
    self.backimage.image = nil;
    self.view.backgroundColor = [UIColor colorWithRed:0.00 green:0.55 blue:0.78 alpha:1];
    
}
- (void)suibian3:(NSNotification *)noti
{
    //    self.contentView.backgroundColor = ;
    
//    self.contentView.backgroundColor = [UIColor colorWithRed:1.00 green:0.36 blue:0.39 alpha:1];
    static int a = 1;
    self.backimage.image = [UIImage imageNamed:[NSString stringWithFormat:@"pifu%d.JPG", a]];
    if (a == 38) {
        a = 0;
    }
    a++;
}
- (void)suibian4:(NSNotification *)noti
{
    //    self.contentView.backgroundColor = ;
    
    //    self.contentView.backgroundColor = [UIColor colorWithRed:0.50 green:0.82 blue:0.39 alpha:1];
    self.backimage.image = nil;
    self.view.backgroundColor = [UIColor orangeColor];
    
}
- (void)suibian5:(NSNotification *)noti
{
    //    self.contentView.backgroundColor = ;
    self.backimage.image = nil;
    self.view.backgroundColor = [UIColor blackColor];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];

    
    self.view.backgroundColor = [UIColor blackColor];
    self.backimage.frame = self.view.bounds;
    self.backimage.image = [UIImage imageNamed:@"pifu14.JPG"];
    self.backimage.userInteractionEnabled = YES;
    [self.view addSubview:self.backimage];
    self.jiazai = [[UIButton alloc] initWithFrame:CGRectMake(120, 300, 80, 50)];
    [self.jiazai setTitle:@"加载中..." forState:UIControlStateNormal];
    [self.jiazai setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.jiazai.backgroundColor = [UIColor whiteColor];
    self.jiazai.alpha = 0.7;
    self.jiazai.layer.cornerRadius = 10;
    [self.backimage addSubview:self.jiazai];
    [self.jiazai release];


//    FXBlurView *mohu = [[FXBlurView alloc] initWithFrame:self.view.bounds];
//    mohu.userInteractionEnabled = YES;
//    mohu.blurEnabled = 10;
//    [self.view addSubview:mohu];
    
//    [self.view addSubview:view];
    if (_biaoji == 2) {
        
        self.navigationItem.title = @"专题详情";
        
        NSString *str = @"http://mobile.ximalaya.com/m/subject_detail";
        NSURL *url = [NSURL URLWithString:str];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
        
        
        request.HTTPMethod = @"POST";
        
        //post请求, 需要带一个数据
        NSString *bodyStr = [NSString stringWithFormat:@"id=%@&device=iPhone", self.idOfjiaodian];
        //把一串字符串转换成NSData类型., 方便发送
        request.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
        
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            
            //data是完整的请求完毕的数据
            if (data != nil) {
                self.dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                self.arr = [self.dictionary objectForKey:@"list"];
                
                for (NSDictionary *dic in self.arr) {
                    
                    [self.arrOfID addObject:[dic objectForKey:@"id"]];
                }
                
                //下拉放大
                self.imageFromWeb = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 180)];
                self.imageFromWeb.backgroundColor = [UIColor clearColor];
                [self.imageFromWeb setUserInteractionEnabled:YES];
                //    self.imageFromWeb.layer.cornerRadius = 10;

                [self.imageFromWeb setImageWithURL:[NSURL URLWithString:[[self.dictionary objectForKey:@"info"] objectForKey:@"coverPathBig"]] placeholderImage:[UIImage imageNamed:@"zhanwei.png"]];
//                [self.view addSubview:self.imageFromWeb];
                CExpandHeader *header = [CExpandHeader expandWithScrollView:self.tableView expandView:self.imageFromWeb];
//                [header release];
                [self.jiazai removeFromSuperview];
                [self.tableView reloadData];
                
            }
        }];
    } else if (self.biaoji == 1) {
//        [NetWorkHandier getConnectionWithURL:[NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/others/ca/album/track/%@/true/1/30?device=iPhone", self.idOfMusic] completion:^(id result) {
        [NetWorkHandier getConnectionWithURL:[NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/others/ca/album/track/%@/true/1/30?device=iPhone", self.idOfMusic] comletion:^(id result) {
            
            self.dicOfType = result;
            NSArray *array = [[self.dicOfType objectForKey:@"tracks"] objectForKey:@"list"];
            for (NSDictionary *dic in array) {
                
                [self.arrOfID addObject:[dic objectForKey:@"trackId"]];
            }

            
//            NSLog(@"---------%@", [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/others/ca/album/track/%@/true/1/30?device=iPhone", self.idOfMusic]);
            
            self.imageFromWeb = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 180)];
            self.imageFromWeb.backgroundColor = [UIColor clearColor];
            [self.imageFromWeb setUserInteractionEnabled:YES];

            //    self.imageFromWeb.layer.cornerRadius = 10;
//            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//            [button setTitle:@"返回" forState:UIControlStateNormal];
//            [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
//            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//            button.frame = CGRectMake(5, 20, 40, 20);
//            [self.view addSubview:button];
            self.imageFromWeb.image = [UIImage imageNamed:@"mohu.jpg"];
//            [self.view addSubview:self.imageFromWeb];
            CExpandHeader *header = [CExpandHeader expandWithScrollView:self.tableView expandView:self.imageFromWeb];
            [header release];
            UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(30, 60, 80, 80)];
            image.backgroundColor = [UIColor clearColor];
            image.layer.cornerRadius = 40;
            image.layer.masksToBounds = YES;
            [image setImageWithURL:[NSURL URLWithString:[[self.dicOfType objectForKey:@"album"] objectForKey:@"coverLarge"]] placeholderImage:[UIImage imageNamed:@"zhanwei.png"]];
            UIImageView *image0 = [[UIImageView alloc] initWithFrame:CGRectMake(27, 63, 80, 80)];
            image0.backgroundColor = [UIColor lightGrayColor];
            image0.layer.cornerRadius = 40;
            image0.layer.masksToBounds = YES;
            [self.imageFromWeb addSubview:image0];
            [self.imageFromWeb addSubview:image];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(140, 50, 120, 40)];
            label.backgroundColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.layer.masksToBounds = YES;
            label.layer.cornerRadius = 5;
            label.alpha = 0.5;
            label.text = [[self.dicOfType objectForKey:@"album"] objectForKey:@"nickname"];
            label.numberOfLines = 0;
//            [label sizeToFit];
            label.textColor = [UIColor whiteColor];
            [self.imageFromWeb addSubview:label];
            [label release];
            
            UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(200, 110, 100, 30)];
            label1.text = [NSString stringWithFormat:@"类型:%@", [[self.dicOfType objectForKey:@"album"] objectForKey:@"tags"]];
            label1.textAlignment = NSTextAlignmentCenter;
            label1.numberOfLines = 0;
            [label1 sizeToFit];
            label1.textColor = [UIColor whiteColor];
            label1.font = [UIFont systemFontOfSize:13];
            [self.imageFromWeb addSubview:label1];
            [label1 release];
            
            [self.jiazai removeFromSuperview];

//            NSLog(@"%@", self.dicOfType);
            [_tableView reloadData];
            
        }];
    

}
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 568) style:UITableViewStylePlain];
//    self.tableView.bounces = NO;

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 140;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    [_tableView registerClass:[SecondTableViewCell class] forCellReuseIdentifier:@"reuse"];
    [self.view addSubview:self.tableView];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 20, 40, 20);
    [self.view addSubview:button];

}

- (void)back:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.biaoji == 2) {
        
        return self.arr.count;
    }else
    return [[[self.dicOfType objectForKey:@"tracks"] objectForKey:@"list"] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"forIndexPath:indexPath];

//    UIView *tempView = [[UIView alloc] init];
//    [cell setBackgroundView:tempView];
//    [cell setBackgroundColor:[UIColor clearColor]];
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    

    if (self.biaoji == 2) {
        
        cell.titlelabel.text = [[self.arr objectAtIndex:indexPath.row] objectForKey:@"title"];
        cell.nickname.text = [[self.arr objectAtIndex:indexPath.row] objectForKey:@"nickname"];
        cell.playsCounts.text = [[[self.arr objectAtIndex:indexPath.row] objectForKey:@"playsCounts"] stringValue];
        cell.commentsCounts.text = [[[self.arr objectAtIndex:indexPath.row] objectForKey:@"commentsCounts"] stringValue];
        cell.sharesCounts.text = [[[self.arr objectAtIndex:indexPath.row] objectForKey:@"sharesCounts"] stringValue];
        cell.favoritesCounts.text = [[[self.arr objectAtIndex:indexPath.row] objectForKey:@"favoritesCounts"] stringValue];
        if ([[self.arr objectAtIndex:indexPath.row] objectForKey:@"coverSmall"] != [NSNull null]) {
            
            [cell.coverSmall setImageWithURL:[NSURL URLWithString:[[[self.dictionary objectForKey:@"list"] objectAtIndex:indexPath.row] objectForKey:@"coverSmall"]] placeholderImage:[UIImage imageNamed:@"zhanwei.png"]];
        } else {
            cell.coverSmall.image = [UIImage imageNamed:@"暂无.jpeg"];
        }
        [cell.goodButton addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
        cell.goodButton.tag = [[[[self.dictionary objectForKey:@"list"] objectAtIndex:indexPath.row] objectForKey:@"id"] intValue];
    } else if (self.biaoji == 1) {
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        cell.titlelabel.text = [[[[self.dicOfType objectForKey:@"tracks"] objectForKey:@"list"] objectAtIndex:indexPath.row] objectForKey:@"title"];
        cell.nickname.text = [[[[self.dicOfType objectForKey:@"tracks"] objectForKey:@"list"] objectAtIndex:indexPath.row] objectForKey:@"nickname"];
        if ([[[[[self.dicOfType objectForKey:@"tracks"] objectForKey:@"list"] objectAtIndex:indexPath.row] objectForKey:@"playtimes"] floatValue] < 10000) {
            cell.playsCounts.text = [NSString stringWithFormat:@"%d",[[[[[self.dicOfType objectForKey:@"tracks"] objectForKey:@"list"] objectAtIndex:indexPath.row] objectForKey:@"playtimes"] intValue]];
        }else{
            
            cell.playsCounts.text =[NSString stringWithFormat:@"%.1f万", [[[[[self.dicOfType objectForKey:@"tracks"] objectForKey:@"list"] objectAtIndex:indexPath.row] objectForKey:@"playtimes"] floatValue]/10000];
        }
        cell.commentsCounts.text = [[[[[self.dicOfType objectForKey:@"tracks"] objectForKey:@"list"] objectAtIndex:indexPath.row] objectForKey:@"likes"] stringValue];
        cell.sharesCounts.text = [[[[[self.dicOfType objectForKey:@"tracks"] objectForKey:@"list"] objectAtIndex:indexPath.row] objectForKey:@"comments"] stringValue];
        cell.favoritesCounts.text = [NSString stringWithFormat:@"%ld", random()/10000000];
        if ([[[[self.dicOfType objectForKey:@"tracks"] objectForKey:@"list"] objectAtIndex:indexPath.row] objectForKey:@"coverSmall"] != [NSNull null]) {
            
            [cell.coverSmall setImageWithURL:[NSURL URLWithString:[[[[self.dicOfType objectForKey:@"tracks"] objectForKey:@"list"] objectAtIndex:indexPath.row] objectForKey:@"coverSmall"]] placeholderImage:[UIImage imageNamed:@"zhanwei.png"]];
            cell.coverSmall.layer.cornerRadius = 5;
            cell.coverSmall.layer.masksToBounds = YES;
        } else {
            cell.coverSmall.image = [UIImage imageNamed:@"暂无.jpeg"];
        }
        [cell.goodButton addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
        cell.goodButton.tag = [[[[[self.dicOfType objectForKey:@"tracks"] objectForKey:@"list"] objectAtIndex:indexPath.row] objectForKey:@"trackId"] intValue];
    }
    
    return cell;
    
}
- (void)collect:(UIButton *)button
{
    [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
        if (result) {
            
            DXAlertView *alert = [[DXAlertView alloc] initWithTitle:@"提示" contentText:@"确定 收 藏 ?" leftButtonTitle:@"取消" rightButtonTitle:@"确定"];
            [alert show];
            alert.leftBlock = ^() {
                //        NSLog(@"left button clicked");
            };
            alert.rightBlock = ^() {
                
                self.collect = button.tag;
                DataBaseHandler *dbHandler = [DataBaseHandler shareInstance];
                [dbHandler insertStudent:self.collect uid:[userInfo uid]];
            };
            alert.dismissBlock = ^() {
                //        NSLog(@"Do something interesting after dismiss block");
            };
        }
        
    }];

}
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex == 0) {
//        
//    } else if (buttonIndex == 1) {
////        [dbHandler closeDB];
//
//    }
//}

- (void)dealloc
{
    [super dealloc];
    [_imageFromWeb release];
    [_backimage release];
    [_tableView release];
    [_arr release];
    [_idOfjiaodian release];
    [_idOfMusic release];
    [_dicOfType release];
    [_array release];
    [_dictionary release];
    [_arrOfID release];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ThreeViewController *threeVC = [[ThreeViewController alloc] init];
    
        threeVC.arrOfjiaodian = self.arrOfID;
        threeVC.ID = [self.arrOfID objectAtIndex:indexPath.row];
        threeVC.biaoji = 2;
        threeVC.mp3index = indexPath.row;
    [threeVC setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];

    
    [self presentViewController:threeVC animated:YES completion:^{
        
    }];
//        [self.navigationController pushViewController:threeVC animated:YES];
    
        [threeVC release];
    
}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//        return 35;
//}

//- (void)scrollViewDidScroll:(UIScrollView*)scrollView
//{
//    
//    CGFloat yOffset   = scrollView.contentOffset.y;
//    if (yOffset < 0) {
//        
//        CGFloat factor = ((ABS(yOffset)+self.imageFromWeb.frame.size.height)*self.imageFromWeb.frame.size.width)/self.imageFromWeb.frame.size.height;
//        CGRect f = CGRectMake(-(factor-self.imageFromWeb.frame.size.width)/2, 0, factor, self.imageFromWeb.frame.size.height+ABS(yOffset));
//        self.imageFromWeb.frame = f;
//    } else {
//        CGRect f = self.imageFromWeb.frame;
//        f.origin.y = -yOffset;
//        self.imageFromWeb.frame = f;
//    }
//    
//}
- (UIColor *)activityIndicatorView:(MONActivityIndicatorView *)activityIndicatorView
      circleBackgroundColorAtIndex:(NSUInteger)index
{
    CGFloat red   = (arc4random() % 256)/255.0;
    CGFloat green = (arc4random() % 256)/255.0;
    CGFloat blue  = (arc4random() % 256)/255.0;
    CGFloat alpha = 1.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (void)viewWillAppear:(BOOL)animated
//{
//    [self.tableView reloadData];
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
