//
//  PictureViewController.m
//  Music
//
//  Created by 浩 郑 on 14-10-10.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import "PictureViewController.h"

@interface PictureViewController ()

@end

@implementation PictureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.arr = [NSMutableArray arrayWithObjects:@"lian0.jpg", @"lian1.jpg", @"lian2.jpg",@"lian3.jpg",@"lian4.jpg",@"lian5.jpg",@"lian6.jpg",@"lian7.jpg",@"lian8.jpg",@"lian9.jpg", nil];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView1 =[[UIImageView alloc]initWithFrame:CGRectMake(10, 20, 80, 80)];
    imageView1.tag = 10000;
    imageView1.image =[UIImage imageNamed:[self.arr objectAtIndex:imageView1.tag - 10000]];
    [self.view addSubview:imageView1];
    [imageView1 release];
    [imageView1 setUserInteractionEnabled:YES];
    
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    
    //设置需要点击几次才会触发方法
    tap1.numberOfTapsRequired = 1;
    //设置需要几个手指点击
    tap1.numberOfTouchesRequired = 1;
    
    //将手势添加到imageView上
    [imageView1 addGestureRecognizer:tap1];
    [tap1 release];
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 20, 80, 80)];
    imageView2.tag = 10001;
    imageView2.image = [UIImage imageNamed:[self.arr objectAtIndex:imageView2.tag - 10000]];
    [self.view addSubview:imageView2];
    [imageView2 release];
    [imageView2 setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    tap2.numberOfTapsRequired = 1;
    tap2.numberOfTouchesRequired = 1;
    [imageView2 addGestureRecognizer:tap2];
    [tap2 release];
    
    UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(190, 20, 80, 80)];
    imageView3.tag = 10002;
    imageView3.image = [UIImage imageNamed:[self.arr objectAtIndex:imageView3.tag - 10000]];
    [self.view addSubview:imageView3];
    [imageView3 release];
    [imageView3 setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    tap3.numberOfTapsRequired = 1;
    tap3.numberOfTouchesRequired = 1;
    [imageView3 addGestureRecognizer:tap3];
    [tap3 release];
    
    UIImageView *imageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 110, 80, 80)];
    imageView4.tag = 10003;
    imageView4.image = [UIImage imageNamed:[self.arr objectAtIndex:imageView4.tag - 10000]];
    [self.view addSubview:imageView4];
    [imageView4 release];
    [imageView4 setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    tap4.numberOfTapsRequired = 1;
    tap4.numberOfTouchesRequired = 1;
    [imageView4 addGestureRecognizer:tap4];
    [tap4 release];
    
    UIImageView *imageView5 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 110, 80, 80)];
    imageView5.tag = 10004;
    imageView5.image = [UIImage imageNamed:[self.arr objectAtIndex:imageView5.tag - 10000]];
    [self.view addSubview:imageView5];
    [imageView5 release];
    [imageView5 setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *tap5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    tap5.numberOfTapsRequired = 1;
    tap5.numberOfTouchesRequired = 1;
    [imageView5 addGestureRecognizer:tap5];
    [tap5 release];
    
    UIImageView *imageView6 = [[UIImageView alloc]initWithFrame:CGRectMake(190, 110, 80, 80)];
    imageView6.tag = 10005;
    imageView6.image = [UIImage imageNamed:[self.arr objectAtIndex:imageView6.tag - 10000]];
    [self.view addSubview:imageView6];
    [imageView6 release];
    [imageView6 setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *tap6 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    tap6.numberOfTapsRequired = 1;
    tap6.numberOfTouchesRequired = 1;
    [imageView6 addGestureRecognizer:tap6];
    [tap6 release];
    
    UIImageView *imageView7 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 200, 80, 80)];
    imageView7.tag = 10006;
    imageView7.image = [UIImage imageNamed:[self.arr objectAtIndex:imageView7.tag - 10000]];
    [self.view addSubview:imageView7];
    [imageView7 release];
    [imageView7 setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *tap7 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    tap7.numberOfTapsRequired = 1;
    tap7.numberOfTouchesRequired = 1;
    [imageView7 addGestureRecognizer:tap7];
    [tap7 release];
    
    UIImageView *imageView8 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 80, 80)];
    imageView8.tag = 10007;
    imageView8.image = [UIImage imageNamed:[self.arr objectAtIndex:imageView8.tag - 10000]];
    [self.view addSubview:imageView8];
    [imageView8 release];
    [imageView8 setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *tap8 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    tap8.numberOfTapsRequired = 1;
    tap8.numberOfTouchesRequired = 1;
    [imageView8 addGestureRecognizer:tap8];
    [tap8 release];
    
    UIImageView *imageView9 = [[UIImageView alloc]initWithFrame:CGRectMake(190, 200, 80, 80)];
    imageView9.tag = 10008;
    imageView9.image = [UIImage imageNamed:[self.arr objectAtIndex:imageView9.tag - 10000]];
    [self.view addSubview:imageView9];
    [imageView9 release];
    [imageView9 setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *tap9 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    tap9.numberOfTapsRequired = 1;
    tap9.numberOfTouchesRequired = 1;
    [imageView9 addGestureRecognizer:tap9];
    [tap9 release];

    
    
}


- (void)tapAction:(UITapGestureRecognizer *)tap
{
    
    self.block2([self.arr objectAtIndex:tap.view.tag - 10000]);
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
