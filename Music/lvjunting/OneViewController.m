//
//  OneViewController.m
//  find
//
//  Created by apple on 14-9-30.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"
#import "INSSearchBar.h"
#import "NetWorkHandier.h"
#import "CloudView.h"
#import "FXBlurView.h"


@interface OneViewController ()<INSSearchBarDelegate>

@property (nonatomic, strong) INSSearchBar *searchBarWithoutDelegate;
@property (nonatomic, strong) INSSearchBar *searchBarWithDelegate;

@property (nonatomic, retain) UIImageView *backimage;
@end

@implementation OneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        self.backimage = [[UIImageView alloc] init];
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
    
    //    UIView *view2 = [self.view viewWithTag:30];
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
    self.backimage.image = nil;

//    self.view.backgroundColor = [UIColor colorWithRed:0.50 green:0.82 blue:0.39 alpha:1];
    self.view.backgroundColor = [UIColor orangeColor];
    
}
- (void)suibian5:(NSNotification *)noti
{
    //    self.contentView.backgroundColor = ;
    self.backimage.image = nil;

    self.view.backgroundColor = [UIColor blackColor];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backimage.frame = self.view.bounds;
    self.backimage.userInteractionEnabled = YES;
    self.backimage.image = [UIImage imageNamed:@"pifu14.JPG"];
    [self.view addSubview:self.backimage];
    
//    FXBlurView *mohu = [[FXBlurView alloc] initWithFrame:self.view.bounds];
//    mohu.userInteractionEnabled = YES;
//    mohu.blurEnabled = 10;
//    [self.view addSubview:mohu];
    
    self.navigationController.navigationBarHidden = YES;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 10, 50, 30);
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];

    
    
    //滚动
    
    
    
    self.arr = [NSMutableArray array];
    NSString *data = @"http://mobile.ximalaya.com/m/explore_track_list?category_name=all&condition=daily&device=iPhone&page=1&per_page=20&tag_name=";
    [NetWorkHandier getConnectionWithURL:data comletion:^(id result) {
        
       NSArray *arr = [result objectForKey:@"list"];
        for (NSDictionary *dic in arr) {
            [self.arr addObject:[dic objectForKey:@"nickname"]];
//            NSLog(@"%@", [dic objectForKey:@"nickname"]);
        }
        self.cv=[[CloudView alloc] initWithFrame:CGRectMake(0, 110, 320, 400)];
        [self.cv reloadData:self.arr];
//        self.cv.layer.borderColor=[UIColor blackColor].CGColor;
//        self.cv.layer.borderWidth=2;
        [self.view addSubview:self.cv];
//        [cv release];
//        [self.view setBackgroundColor:[UIColor blackColor]];
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = [UIColor colorWithRed:0.00 green:0.55 blue:0.78 alpha:1];
        
        void(^push)(NSString *name) = ^(NSString *name){
            for (UIView *v in self.cv.subviews) {
                [v removeFromSuperview];
            }
            
            TwoViewController *twoVC = [[TwoViewController alloc] init];
            twoVC.biaoji = 2;
            [self.navigationController pushViewController:twoVC animated:YES];
            NSString *url = [NSString stringWithFormat:@"http://mobile.ximalaya.com/s/mobile/search?condition=%%20%@&device=iPhone&page=1&per_page=20&scope=voice&sort=", name];
//                NSLog(@"%@",url);
            twoVC.string = url;
            [twoVC release];
            
        };
        self.cv.block = push;
        
    }];
    
    
    
    
    
	
    //下面的
	UILabel *descriptionLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 60, CGRectGetWidth(self.view.bounds) - 40.0, 20.0)];
	descriptionLabel2.textColor = [UIColor whiteColor];
	descriptionLabel2.font = [UIFont fontWithName:@"AvenirNext-Regular" size:16.0];
	descriptionLabel2.text = @"搜索";
	
	[self.view addSubview:descriptionLabel2];
	
	self.searchBarWithDelegate = [[INSSearchBar alloc] initWithFrame:CGRectMake(70, 56, 44.0, 34.0)];
    
	self.searchBarWithDelegate.delegate = self;
    
	
	[self.view addSubview:self.searchBarWithDelegate];
}
//改变下面点击后弹出搜索框的位置
- (CGRect)destinationFrameForSearchBar:(INSSearchBar *)searchBar
{
	return CGRectMake(70, 56, 250, 30);
}
//每次点击下面放大镜的触发方法(开始触发)
- (void)searchBar:(INSSearchBar *)searchBar willStartTransitioningToState:(INSSearchBarState)destinationState
{
    NSLog(@"每次点击下面放大镜的触发方法");
}
//每次点击下面放大镜的触发方法(结束触发)
- (void)searchBar:(INSSearchBar *)searchBar didEndTransitioningFromState:(INSSearchBarState)previousState
{
	NSLog(@"每次点击下面放大镜的触发方法");
}
//点击键盘上的<return>触发的点击事件
- (void)searchBarDidTapReturn:(INSSearchBar *)searchBar
{
    NSLog(@"点击键盘上的<return>触发的点击事件");
    self.str = [NSString string];
    self.str = searchBar.searchField.text;
    NSLog(@"=======%@",searchBar.searchField.text);
    NSLog(@"+++++++%@",self.str);
    //http://mobile.ximalaya.com/s/mobile/search?condition=%20aaaaaaaaa&device=iPhone&page=1&per_page=20&scope=voice&sort= HTTP/1.1
    //遇到百分号在前面再加一个%
     self.str = [NSString stringWithFormat:@"http://mobile.ximalaya.com/s/mobile/search?condition=%%20%@&device=iPhone&page=1&per_page=20&scope=voice&sort=", self.str];
//    NSLog(@"**************************************%@",self.str);
    TwoViewController *two = [[TwoViewController alloc]init];
    two.string = self.str;
    two.biaoji = 2;
    [self.navigationController pushViewController:two animated:YES];
    [two release];
    
    for (UIView *v in self.cv.subviews) {
        [v removeFromSuperview];
    }
    
}
//获取每个值
- (void)searchBarTextDidChange:(INSSearchBar *)searchBar
{
    NSLog(@"%@", searchBar.searchField.text);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [self.view setNeedsDisplay];
//    [self.view setNeedsLayout];
//}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)back:(UIButton *)button
{
//    [self dismissViewControllerAnimated:YES completion:^{
//        
//    }];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc
{
    [super dealloc];
    [_str release];
    [_dic release];
    [_arr release];
    [_cv release];
    [_searchBarWithDelegate release];
    [_searchBarWithoutDelegate release];
    [_backimage release];
    
}
//- (void)viewWillAppear:(BOOL)animated

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
