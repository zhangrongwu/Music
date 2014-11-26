//
//  MusicOnLine.m
//  Music
//
//  Created by lothario on 14-9-29.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import "MusicOnLine.h"
#import "PininterestLikeMenu.h"
#import "ZYQSphereView.h"
#import "PhotoAlbum.h"
#import "NetworkHandler.h"
#import "SecondViewController.h"
#import "MyTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

#import "BBTableView.h"
#import "BBCell.h"
#define KEY_TITLE @"title"
#define KEY_IMAGE_NAME @"image_name"
#define KEY_IMAGE @"image"

#import "TwoViewController.h"
#import "OneViewController.h"
#import "ThreeViewController.h"

#import "FXBlurView.h"
#import "MONActivityIndicatorView.h"

@interface MusicOnLine ()<UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate, MONActivityIndicatorViewDelegate>
//排行
{
    NSMutableArray *mDataSource;
}
@property (nonatomic, retain)BBTableView *tableView1;
@property (nonatomic, retain)NSMutableArray *arrayOfPaihang;





@property (nonatomic, retain)UIScrollView *scrollView;

//长按弹出按钮的属性
@property (nonatomic, assign) CGPoint beginLocation;
@property (nonatomic, strong) PininterestLikeMenu *menu;



//分类3D
@property (nonatomic, retain) ZYQSphereView *sphereView;
@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic, retain) NSMutableArray *arrOfTypeName;


//焦点
@property (nonatomic, strong) NSMutableArray *tableItems;
@property (nonatomic, retain) NSMutableArray *arr;
@property (nonatomic, retain)UITableView *tableView;
@property (nonatomic, retain)NSMutableArray *idOfjiaodian;

@end

@implementation MusicOnLine

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"分类";
        self.scrollView = [[UIScrollView alloc] init];
        self.navigationController.navigationBarHidden = YES;
        self.arrayOfPaihang = [NSMutableArray array];
        self.arrOfTypeName = [NSMutableArray array];
        
        self.arrOfId = [NSMutableArray array];
        
        self.backimagepaihang = [[UIImageView alloc] init];
        
        self.kaiji = [[UIImageView alloc] init];

        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self selector:@selector(suibian1:) name:@"主题1" object:nil];
        [center addObserver:self selector:@selector(suibian2:) name:@"主题2" object:nil];
        [center addObserver:self selector:@selector(suibian3:) name:@"主题3" object:nil];
        [center addObserver:self selector:@selector(suibian4:) name:@"主题4" object:nil];
        [center addObserver:self selector:@selector(suibian5:) name:@"主题5" object:nil];

        
    }
    return self;
}
- (void)suibian1:(NSNotification *)noti
{
//    self.contentView.backgroundColor = ;
    self.backimagepaihang.image = nil;
    UIView *view = [self.view viewWithTag:30];
//    UIView *view2 = [self.view viewWithTag:30];
    view.backgroundColor = [UIColor colorWithRed:0.63 green:0.17 blue:0.43 alpha:1];
//    view2.backgroundColor = [UIColor colorWithRed:0.63 green:0.17 blue:0.43 alpha:1];
    
}
- (void)suibian2:(NSNotification *)noti
{
    //    self.contentView.backgroundColor = ;
    self.backimagepaihang.image = nil;

    UIView *view = [self.view viewWithTag:30];
    view.backgroundColor = [UIColor colorWithRed:0.00 green:0.55 blue:0.78 alpha:1];
    
}
- (void)suibian3:(NSNotification *)noti
{
    //    self.contentView.backgroundColor = ;
    static int a = 1;
    self.backimagepaihang.image = [UIImage imageNamed:[NSString stringWithFormat:@"pifu%d.JPG", a]];
    if (a == 38) {
        a = 0;
    }
    a++;
    
}
- (void)suibian4:(NSNotification *)noti
{
    //    self.contentView.backgroundColor = ;
    self.backimagepaihang.image = nil;

    UIView *view = [self.view viewWithTag:30];
    view.backgroundColor = [UIColor orangeColor];
    
}
- (void)suibian5:(NSNotification *)noti
{
    //    self.contentView.backgroundColor = ;
    self.backimagepaihang.image = nil;

    UIView *view = [self.view viewWithTag:30];
    view.backgroundColor = [UIColor blackColor];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //长按弹出按钮
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(popPininterestMenu:)];
    gesture.delegate = self;
    //判定为长按手势  需要的最短时间
    gesture.minimumPressDuration = 0.5;
    [self.view addGestureRecognizer:gesture];




    
    self.scrollView.frame = CGRectMake(0, 0, 320, 588);
    //scrollView的滚动范围
    self.scrollView.contentSize = CGSizeMake(320*3, 0);
    //设置能否滚动
    self.scrollView.scrollEnabled = NO;
    //按页翻动
    self.scrollView.pagingEnabled = NO;
    //是否要滚动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //scrollView的偏移量(刚开始默认位置)
    self.scrollView.contentOffset = CGPointMake(0, 0);
    //scrollView的代理(需要签署协议)
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = YES;//防止乱跳

    
   //分类
    self.view001 = [[UIImageView alloc] initWithFrame:CGRectMake(0, -40, 320, 588)];
    self.view001.backgroundColor = [UIColor blackColor];
    self.view001.image = [UIImage imageNamed:@"pifu17.JPG"];
    self.view001.userInteractionEnabled = YES;
    MONActivityIndicatorView *indicatorView = [[MONActivityIndicatorView alloc] init];
    indicatorView.numberOfCircles = 3;
    indicatorView.radius = 20;
    indicatorView.internalSpacing = 3;
    indicatorView.duration = 0.5;
    indicatorView.delay = 0.5;
    indicatorView.center = self.view001.center;
    indicatorView.delegate = self;
    [self.view001 addSubview:indicatorView];
    
    [indicatorView startAnimating];

    
////    FXBlurView *mohu001 = [[FXBlurView alloc] initWithFrame:self.view001.bounds];
//    FXBlurView *mohu001 = [FXBlurView sharedInstance];
//    mohu001.frame = self.view001.bounds;
//    mohu001.userInteractionEnabled = YES;
//    mohu001.blurRadius = 80;
//    [self.view001 addSubview:mohu001];
////    [mohu001 release];


    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
    
    //设置需要点击几次才会触发
    tap1.numberOfTapsRequired = 2;
    
    //将手势添加到imageView上
    [self.view001 addGestureRecognizer:tap1];
    [tap1 release];

    [self.scrollView addSubview:self.view001];
    
    
    NSMutableArray *arrayOfType = [NSMutableArray array];
    NSString *typeurl = @"http://mobile.ximalaya.com/m/category_tag_list?category=music&device=iPhone&type=album";
    [NetworkHandler getConnectionWithURL:typeurl completion:^(id result) {
        NSArray *arr = [result objectForKey:@"list"];
        for (NSDictionary *dic in arr) {
            NSString *tname = [dic objectForKey:@"tname"];
            [self.arrOfTypeName addObject:tname];
            tname = [tname substringToIndex:2];
            [arrayOfType addObject:tname];
        }
        self.sphereView = [[ZYQSphereView alloc] initWithFrame:CGRectMake(10, 10, 300, 250)];
        self.sphereView.center=CGPointMake(self.view.center.x, self.view.center.y-20);
        NSMutableArray *views = [[NSMutableArray alloc] init];
        for (int i = 0; i < [arrayOfType count]; i++) {
            UIButton *subV = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 80, 60)];
            subV.tag = i + 1;
            subV.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100. green:arc4random_uniform(100)/100. blue:arc4random_uniform(100)/100. alpha:1];
            [subV setTitle:[NSString stringWithFormat:@"%@",[arrayOfType objectAtIndex:i]] forState:UIControlStateNormal];
            subV.layer.masksToBounds=YES;
            subV.layer.cornerRadius=3;
            [subV addTarget:self action:@selector(subVClick:) forControlEvents:UIControlEventTouchUpInside];
            [views addObject:subV];
            [subV release];
        }
        
        [self.sphereView setItems:views];
        
        self.sphereView.isPanTimerStart=YES;
        [views release];
        
        [self.view001 addSubview:self.sphereView];
        [self.sphereView timerStart];
        [indicatorView stopAnimating];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(330, 10, 50, 50);
        button.backgroundColor = [UIColor redColor];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [button release];
        
    }];
    
	   
    
    
    
    
    
    
    
    
    
    
//    //焦点
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(320, -20, 320, 568)];
    view1.backgroundColor = [UIColor blackColor];
    [self.scrollView addSubview:view1];
    
    
    self.arr = [[NSMutableArray alloc] init];
    self.idOfjiaodian = [[NSMutableArray alloc] init];
    // Load the items in the table
    self.tableItems = [[NSMutableArray alloc]init];
    [NetworkHandler getConnectionWithURL:@"http://mobile.ximalaya.com/m/subject_list?device=iPhone&page=1&per_page=20" completion:^(id result) {
        //处理数据
        self.arr = [result objectForKey:@"list"];
        //for循环将字典转化为movie对象
        for (NSDictionary *dic in self.arr) {
            if ([[dic objectForKey:@"contentType"] intValue] == 2) {
                
                NSString *imageurl = [dic objectForKey:@"coverPathBig"];
                [self.tableItems addObject:imageurl];
                NSString *idOfjiaodian = [dic objectForKey:@"specialId"];
                [self.idOfjiaodian addObject:idOfjiaodian];
            }
        }
//        NSLog(@"%@", self.idOfjiaodian);
//        [indicatorView stopAnimating];

        [self.tableView reloadData];
    }];
    
    
    self.tableView =  [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 320, 568) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 140;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [view1 addSubview:self.tableView];
    [_tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"parallaxCell"];


    
    
    
    
    //排行
    [NetworkHandler getConnectionWithURL:@"http://mobile.ximalaya.com/m/explore_track_list?category_name=music&condition=hot&device=iPhone&page=1&per_page=20&tag_name=" completion:^(id result) {
        self.arrayOfPaihang = [result objectForKey:@"list"];
        for (NSDictionary *dic in self.arrayOfPaihang) {
            
            [self.arrOfId addObject:[dic objectForKey:@"id"]];
            
        }
//        [indicatorView stopAnimating];

        [self.tableView1 reloadData];
    }];
    
    
    
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(640, -20, 320, 589)];
    view2.tag = 30;
    view2.backgroundColor = [UIColor colorWithRed:0.63 green:0.17 blue:0.43 alpha:1];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
//    FXBlurView *mohu = [[FXBlurView alloc] initWithFrame:view2.bounds];
//    mohu.userInteractionEnabled = YES;
//    mohu.blurEnabled = 10;

    
    self.backimagepaihang.frame = view2.bounds;
    self.backimagepaihang.image = [UIImage imageNamed:@"pifu14.JPG"];
    self.backimagepaihang.userInteractionEnabled = YES;
    [view2 addSubview:self.backimagepaihang];
//    [view2 addSubview:mohu];
    
    
    //设置需要点击几次才会触发
    tap.numberOfTapsRequired = 2;
    
    //将手势添加到imageView上
    [view2 addGestureRecognizer:tap];
    [tap release];
//    [mohu release];
    
    
    [self.scrollView addSubview:view2];
    
    self.tableView1 = [[BBTableView alloc] initWithFrame:CGRectMake(0, 0, 320, 588) style:UITableViewStylePlain];
    self.tableView1.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView1.opaque=NO;
//    self.tableView.backgroundColor = [UIColor redColor];
    self.tableView1.showsHorizontalScrollIndicator=NO;
    self.tableView1.showsVerticalScrollIndicator=YES;
    self.tableView1.delegate = self;
    self.tableView1.dataSource = self;
    self.tableView1.rowHeight = 70;
//    self.tableView1.enableInfiniteScrolling = YES;
//    [self loadDataSource];
    [view2 addSubview:self.tableView1];

    
    
    
    
    
    
    
    
    
    self.scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.scrollView];
    [self.scrollView release];
    
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //只要scrollView被滚动就就触发
    
//    NSLog(@"滚动触发");
    if (self.scrollView.contentOffset.x == 0 || self.scrollView.contentOffset.x == 320) {
        self.navigationController.navigationBarHidden = YES;
    }else{
        self.navigationController.navigationBarHidden = YES;
    }
    //焦点
    NSArray *visibleCells = [self.tableView visibleCells];
    
    for (MyTableViewCell *cell in visibleCells) {
        [cell cellOnTableView:self.tableView didScrollOnView:self.view];
    }


}

//分类
-(void)subVClick:(UIButton*)sender
{
    TwoViewController *twoVC = [[TwoViewController alloc] init];
//    NSLog(@"%@",[self.arrOfTypeName objectAtIndex:sender.tag]);
    twoVC.nameOfType = [self.arrOfTypeName objectAtIndex:sender.tag];
    twoVC.biaoji = 1;
    [self.navigationController pushViewController:twoVC animated:YES];
    
    [twoVC release];
    BOOL isStart=[self.sphereView isTimerStart];
    
    [self.sphereView timerStop];
    
    [UIView animateWithDuration:0.3 animations:^{
        sender.transform=CGAffineTransformMakeScale(1.5, 1.5);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            sender.transform=CGAffineTransformMakeScale(1, 1);
            if (isStart) {
                [self.sphereView timerStart];
            }
        }];
    }];
}

//长按弹出按钮
- (void)showMenu
{
    if (!self.menu) {
        PininterestLikeMenuItem *item0 = [[PininterestLikeMenuItem alloc] initWithImage:[UIImage imageNamed:@"center"]
                                                                           selctedImage:[UIImage imageNamed:@"center-highlighted"]
                                                                          selectedBlock:^(void) {
                                                                              NSLog(@"item 0 selected");
                                                                                                                                                            self.scrollView.contentOffset = CGPointMake(0, -40);
                                                                              self.title = @"分类";
                                                                          }];
        PininterestLikeMenuItem *item1 = [[PininterestLikeMenuItem alloc] initWithImage:[UIImage imageNamed:@"center"]
                                                                           selctedImage:[UIImage imageNamed:@"center-highlighted"]
                                                                          selectedBlock:^(void) {
                                                                              NSLog(@"item 1 selected");
                                                                              self.scrollView.contentOffset = CGPointMake(320, 0);
                                                        self.title = @"焦点";
                                                                              
                                                                          }];
        PininterestLikeMenuItem *item2 = [[PininterestLikeMenuItem alloc] initWithImage:[UIImage imageNamed:@"center"]
                                                                           selctedImage:[UIImage imageNamed:@"center-highlighted"]
                                                                          selectedBlock:^(void) {
                                                                              NSLog(@"item 2 selcted");
                                                                              self.title = @"排行";
                                                                              
                                                                              self.scrollView.contentOffset = CGPointMake(640, 0);
                                                                          }];
        PininterestLikeMenuItem *item3 = [[PininterestLikeMenuItem alloc] initWithImage:[UIImage imageNamed:@"center"]
                                                                           selctedImage:[UIImage imageNamed:@"center-highlighted"]
                                                                          selectedBlock:^(void) {
                                                                              NSLog(@"item 3 selcted");
                                                                             
                                                                              OneViewController *oneVC = [[OneViewController alloc] init];
                                                                              [self.navigationController pushViewController:oneVC animated:YES];
                                                                              
                                                                              [oneVC release];
                                                                          }];
        
        NSArray *subMenus = @[item0, item1, item2, item3];
        
        self.menu = [[PininterestLikeMenu alloc] initWithSubMenus:subMenus withStartPoint:self.beginLocation];
    }
    
    [self.menu show];
    
}

- (void)popPininterestMenu:(UIGestureRecognizer *)gesture
{
    CGPoint location = [gesture locationInView:self.view.window];
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.beginLocation = location;
        [self showMenu];
    }
    else if (gesture.state == UIGestureRecognizerStateChanged)
    {
        [self.menu updataLocation:location];
    }
    else{
        self.beginLocation = CGPointZero;
        [self.menu finished:location];
        self.menu = nil;
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return NO;
}


//焦点
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    [self scrollViewDidScroll:nil];
//}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableView1) {
//        return  [mDataSource count];
//        NSLog(@"====%d", [self.arrayOfPaihang count]);
        return [self.arrayOfPaihang count];
    }

    return self.tableItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //排行
    if (tableView == self.tableView1) {
        static NSString *test = @"table";
        BBCell *cell = (BBCell*)[tableView dequeueReusableCellWithIdentifier:test];
        if( !cell )
        {
            cell = [[BBCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:test];
        }
//        NSDictionary *info = [mDataSource objectAtIndex:indexPath.row ];
//        [cell setCellTitle:[info objectForKey:KEY_TITLE]];
//        [cell setIcon:[info objectForKey:KEY_IMAGE]];
        [cell setCellTitle:[[self.arrayOfPaihang objectAtIndex:indexPath.row] objectForKey:@"title"]];
        
        NSString *str = [[self.arrayOfPaihang objectAtIndex:indexPath.row] objectForKey:@"coverSmall"];
        if (![str isKindOfClass:[NSNull class]]) {
            
            NSString *newStr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            NSURL *url = [NSURL URLWithString:newStr];
            
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
            
            request.HTTPMethod = @"GET";
            
            //2.连接服务器
            
            
            //参数1:请求
            //参数2:请求结束之后, 返回到哪个线程继续执行任务
            //参数3:请求结束执行block中的内容
            [cell setIcon:[self circleImage:[UIImage imageNamed:@"zhanwei.png"] withParam:0]];
            [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                
                //data是完整的请求完毕的数据
                if (data != nil) {
                    
                    //[cell setIcon:[UIImage imageWithData:data]];
                    [cell setIcon:[self circleImage:[UIImage imageWithData:data] withParam:0]];
                }
            }];
        }

        
        
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        return cell;

    }
 //焦点
    static NSString *CellIdentifier = @"parallaxCell";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //    NSString *title = [[self.arr objectAtIndex:indexPath.row] objectForKey:@"title"];
    //    cell.titleLabel.text = title;
    //    cell.subtitleLabel.text = [NSString stringWithFormat:NSLocalizedString(@"This is a parallex cell %d",),indexPath.row];
    
    //1.创建请求
    
    NSString *str = [self.tableItems objectAtIndex:indexPath.row];
    
    NSString *newStr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:newStr];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    
    request.HTTPMethod = @"GET";
    
    //2.连接服务器
    
    
    //参数1:请求
    //参数2:请求结束之后, 返回到哪个线程继续执行任务
    //参数3:请求结束执行block中的内容
    cell.myImageView.image = [UIImage imageNamed:@"zhanwei.png"];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        //data是完整的请求完毕的数据
        if (data != nil) {
            cell.myImageView.image = [UIImage imageWithData:data];
        }
    }];
    
    cell.label.text = [[self.arr objectAtIndex:indexPath.row] objectForKey:@"title"];
//    [cell.label sizeToFit];
    cell.selectionStyle = UITableViewCellEditingStyleNone;

    return cell;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    // Get visible cells on table view.
//    NSArray *visibleCells = [self.tableView visibleCells];
//    
//    for (MyTableViewCell *cell in visibleCells) {
//        [cell cellOnTableView:self.tableView didScrollOnView:self.view];
//    }
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableView1) {
        ThreeViewController *threeVC = [[ThreeViewController alloc] init];
        
        threeVC.arrOfjiaodian = self.arrOfId;
        threeVC.mp3index = indexPath.row;

//        NSLog(@"===%@",self.arrOfId);
        threeVC.ID = [self.arrOfId objectAtIndex:indexPath.row];
//        NSLog(@"===%ld", (long)indexPath.row);
        [threeVC setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];

        [self presentViewController:threeVC animated:YES completion:^{
            
        }];
//        [self.navigationController pushViewController:threeVC animated:YES];
        [threeVC release];
        
    }else{
    
//    self.navigationController.navigationBarHidden = NO;
    SecondViewController *secondVC = [[SecondViewController alloc]init];
        secondVC.biaoji = 2;
        secondVC.idOfjiaodian = [self.idOfjiaodian objectAtIndex:indexPath.row];
//    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:secondVC];
//    secondVC.navigationController.navigationBarHidden = NO;
    [self.navigationController pushViewController:secondVC animated:YES];
        [secondVC release];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    //we need to update the cells as the table might have changed its dimensions after rotation
    // [self setupShapeFormationInVisibleCells];
    
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    //update the cells to form the circle shape
//    //[self setupShapeFormationInVisibleCells];
//}

//无限
//- (IBAction)enableInfiniteScrolling:(id)sender
//{
//    [self.tableView setEnableInfiniteScrolling:[sender isOn]];
//    [self.tableView reloadData];
//}
//左右
//- (IBAction)switchDirections:(id)sender
//{
//    [self.tableView setContentAlignment:[sender selectedSegmentIndex] ? eBBTableViewContentAlignmentRight : eBBTableViewContentAlignmentLeft];
//    [self.tableView reloadData];
//}

//双击手势触发的方法
- (void)tapAction:(UITapGestureRecognizer *)tap
{
//    NSLog(@"点击");
    static int a = 2;
    if (a > 1 && a < 15) {
        
        [NetworkHandler getConnectionWithURL:[NSString stringWithFormat:@"http://mobile.ximalaya.com/m/explore_track_list?category_name=music&condition=hot&device=iPhone&page=%d&per_page=20&tag_name=",a] completion:^(id result) {
            self.arrayOfPaihang = [result objectForKey:@"list"];
            self.arrOfId = [NSMutableArray array];
            for (NSDictionary *dic in self.arrayOfPaihang) {
                
                [self.arrOfId addObject:[dic objectForKey:@"id"]];
                
            }

            [self.tableView1 reloadData];
        }];
        a++;
    }

    

}



-(void)dealloc
{
    [_tableView release];
    [_arr release];
    [super dealloc];
}

- (UIColor *)activityIndicatorView:(MONActivityIndicatorView *)activityIndicatorView
      circleBackgroundColorAtIndex:(NSUInteger)index
{
    CGFloat red   = (arc4random() % 256)/255.0;
    CGFloat green = (arc4random() % 256)/255.0;
    CGFloat blue  = (arc4random() % 256)/255.0;
    CGFloat alpha = 1.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)buttonClicked:(UIButton *)button
{
    NSLog(@"ad");
}

- (void)viewWillAppear:(BOOL)animated{
    // all settings are basic, pages with custom packgrounds, title image on each page
    
    static int a = 1;
    if (a == 1) {
        
        [self showIntroWithCrossDissolve];
        //    [self showBasicIntroWithBg];
        //    [self showBasicIntroWithFixedTitleView];
        //    [self showCustomIntro];
        //    [self showIntroWithCustomView];
        //    [self showIntroWithSeparatePagesInit];
        [super viewDidAppear:animated];
        //        [self scrollViewDidScroll:nil];
        a++;
    }
    
    // all settings are basic, introview with custom background, title image on each page
    //[self showBasicIntroWithBg];
    
    // all settings are basic, introview with custom background color and fixed title image
    //[self showBasicIntroWithFixedTitleView];
    
    // all settings are custom
    //[self showCustomIntro];
    
    // using customView property of EAIntroPage
    //[self showIntroWithCustomView];
    
    // separate pages initialization
    //[self showIntroWithSeparatePagesInit];
}

- (void)showIntroWithCrossDissolve {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Ranklist";
    page1.desc = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
    page1.bgImage = [UIImage imageNamed:@"01"];
    page1.titleImage = [UIImage imageNamed:@"original"];
    
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"search page";
    page2.desc = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
    page2.bgImage = [UIImage imageNamed:@"02"];
    page2.titleImage = [UIImage imageNamed:@"supportcat"];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"3D technology";
    page3.desc = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
    page3.bgImage = [UIImage imageNamed:@"03"];
    page3.titleImage = [UIImage imageNamed:@"femalecodertocat"];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3]];
    
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.0];
}
- (void)tapAction1:(UITapGestureRecognizer *)tap
{
    static int a = 1;
    if (a == 41) {
        a = 1;
    }
    if (a<42) {
        self.view001.image = [UIImage imageNamed:[NSString stringWithFormat:@"pifu%d.JPG", a]];
        a++;
    }
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
