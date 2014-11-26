//
//  OurViewController.m
//  Our
//
//  Created by apple on 14-10-9.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "OurViewController.h"
//#import "UIView+MWParallax.h"

@interface OurViewController ()
@end

@implementation OurViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"关于我们";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(130, 20, 100, 50)];
    title.text = @"关于我们";
    title.font = [UIFont systemFontOfSize:18];
    title.textColor = [UIColor whiteColor];
    [self.view addSubview:title];
    
    
    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController.navigationBar setAlpha:0.3];
    UIColor *bgColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"aboutour.jpg"]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:37/255.0 green:83/255.0 blue:244/255.0 alpha:1]];
    [self.view setBackgroundColor:bgColor];
    CGFloat x = self.view.frame.size.width;
    //照片
    self.diaoimageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, x / 3, x / 3, x / 3)];
    self.diaoimageview.image = [UIImage imageNamed:@"diao.JPG"];
    self.diaoimageview.layer.masksToBounds = YES;
    self.diaoimageview.layer.cornerRadius  = 50;
    CALayer *layer1 = [self.diaoimageview layer];
    layer1.borderColor = [UIColor colorWithRed:221/255.0 green:216/255.0 blue:234/255.0 alpha:1].CGColor;
    layer1.borderWidth = 3.0f;
    self.diaoimageview.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.diaoimageview];
    [_diaoimageview release];
    
    
    self.haoimageview = [[UIImageView alloc]initWithFrame:CGRectMake(x / 3, x / 3, x / 3, x / 3)];
    self.haoimageview.backgroundColor = [UIColor greenColor];
    self.haoimageview.layer.masksToBounds = YES;
    CALayer *layer2 = [self.haoimageview layer];
    layer2.borderColor = [UIColor colorWithRed:221/255.0 green:216/255.0 blue:234/255.0 alpha:1].CGColor;
    layer2.borderWidth = 3.0f;
    self.haoimageview.layer.cornerRadius  = 50;
    self.haoimageview.image = [UIImage imageNamed:@"hao.png"];
    [self.view addSubview:self.haoimageview];
    [self.haoimageview release];
    
    
    self.lvimageview = [[UIImageView alloc]initWithFrame:CGRectMake(x * 2 / 3, x / 3, x / 3, x / 3)];
    self.lvimageview.backgroundColor = [UIColor yellowColor];
    self.lvimageview.layer.masksToBounds = YES;
    self.lvimageview.layer.cornerRadius  = 50;
    CALayer *layer3 = [self.lvimageview layer];
    layer3.borderColor = [UIColor colorWithRed:221/255.0 green:216/255.0 blue:234/255.0 alpha:1].CGColor;
    layer3.borderWidth = 3.0f;
    self.lvimageview.image = [UIImage imageNamed:@"ting.png"];
    [self.view addSubview:self.lvimageview];
    [self.lvimageview release];
    
    //名字
    
    self.diaoname = [[UILabel alloc]initWithFrame:CGRectMake(0, 220, x / 3, 20)];
    self.diaoname.backgroundColor = [UIColor clearColor];
    self.diaoname.text = @"叼哥";
    self.diaoname.textAlignment = UITextAlignmentCenter;
    [self.diaoname setTextColor:[UIColor whiteColor]];;
    [self.view addSubview:self.diaoname];
    [self.diaoname release];
    
    self.haoname = [[UILabel alloc]initWithFrame:CGRectMake(x / 3, 220, x / 3, 20)];
    self.haoname.backgroundColor = [UIColor clearColor];
    self.haoname.text = @"浩哥";
    self.haoname.textAlignment = UITextAlignmentCenter;
    [self.haoname setTextColor:[UIColor whiteColor]];
    [self.view addSubview:self.haoname];
    [self.diaoname release];

    self.lvname = [[UILabel alloc]initWithFrame:CGRectMake(x * 2 / 3, 220, x / 3, 20)];
    self.lvname.backgroundColor = [UIColor clearColor];
    self.lvname.text = @"廷廷";
    self.lvname.textAlignment = UITextAlignmentCenter;
    [self.lvname setTextColor:[UIColor whiteColor]];
    [self.view addSubview:self.lvname];
    [self.lvname release];

    self.Leader = [[UILabel alloc]initWithFrame:CGRectMake(0, 240, x / 3, 20)];
    self.Leader.text = @"Leader";
    self.Leader.backgroundColor = [UIColor clearColor];
    self.Leader.textAlignment = UITextAlignmentCenter;
    [self.Leader setTextColor:[UIColor whiteColor]];
    [self.view addSubview:self.Leader];
    [self.Leader release];
    
    
    self.ui1 = [[UILabel alloc]initWithFrame:CGRectMake(x / 3, 240, x / 3, 20)];
    self.ui1.text = @"UI";
    self.ui1.backgroundColor = [UIColor clearColor];
    self.ui1.textAlignment = UITextAlignmentCenter;
    [self.ui1 setTextColor:[UIColor whiteColor]];
    [self.view addSubview:self.ui1];
    [self.ui1 release];

    
    self.ui2 = [[UILabel alloc]initWithFrame:CGRectMake( x * 2 / 3, 240, x / 3, 20)];
    self.ui2.text = @"UI";
    self.ui2.backgroundColor = [UIColor clearColor];
    self.ui2.textAlignment = UITextAlignmentCenter;
    [self.ui2 setTextColor:[UIColor whiteColor]];
    [self.view addSubview:self.ui2];
    [self.ui2 release];

    
    
    
    
    self.address = [[UILabel alloc]initWithFrame:CGRectMake(10, 280, 300, 30)];
    self.address.backgroundColor = [UIColor clearColor];
    [self.address setTextColor:[UIColor whiteColor]];
    self.address.text = @"     2014.10 不用多久我就会升职加薪，当上总经理，出任CEO，赢取白富美，走上人生巅峰!!";
    [self.address setNumberOfLines:0];
            [self.address sizeToFit];

    [self.view addSubview:self.address];
    [self.address release];

    
    self.mail = [[UILabel alloc]initWithFrame:CGRectMake(10, 360, 70, 30)];
    self.mail.backgroundColor = [UIColor clearColor];
    [self.mail setTextColor:[UIColor whiteColor]];
    self.mail.text = @"联系邮箱";
    [self.view addSubview:self.mail];
    [self.mail release];
    
    
    self.diaomail = [[UILabel alloc]initWithFrame:CGRectMake(90, 360, 210, 30)];
    self.diaomail.backgroundColor = [UIColor clearColor];
    [self.diaomail setTextColor:[UIColor whiteColor]];
    self.diaomail.text = @"z_xiangqing@yahoo.com";
    [self.view addSubview:self.diaomail];
    [self.diaomail release];
    
    
    self.haomail = [[UILabel alloc]initWithFrame:CGRectMake(90, 395, 210, 30)];
    self.haomail.backgroundColor = [UIColor clearColor];
    [self.haomail setTextColor:[UIColor whiteColor]];
    self.haomail.text = @"yclns3@163.com";
    [self.view addSubview:self.haomail];
    [self.haomail release];
    
    
    
    self.lvmail = [[UILabel alloc]initWithFrame:CGRectMake(90, 430, 210, 30)];
    self.lvmail.backgroundColor = [UIColor clearColor];
    [self.lvmail setTextColor:[UIColor whiteColor]];
    self.lvmail.text = @"otuqiwetr@qq.com";
    [self.view addSubview:self.lvmail];
    [self.lvmail release];



    
//    self.view.iOS6ParallaxIntensity = -20;
//    
//    self.diaoimageview.iOS6ParallaxIntensity = 30;
//    self.haoimageview.iOS6ParallaxIntensity = 30;
//    self.lvimageview.iOS6ParallaxIntensity = 30;
//    
//    self.lvmail.iOS6ParallaxIntensity = 30;
//    self.lvname.iOS6ParallaxIntensity = 30;
//    
//    self.haomail.iOS6ParallaxIntensity = 30;
//    self.haoname.iOS6ParallaxIntensity = 30;
//    
//    self.diaomail.iOS6ParallaxIntensity = 30;
//    self.diaoname.iOS6ParallaxIntensity = 30;
//    
//    self.address.iOS6ParallaxIntensity = 30;
//    self.ui2.iOS6ParallaxIntensity = 30;
//    self.ui1.iOS6ParallaxIntensity = 30;
//    self.Leader.iOS6ParallaxIntensity = 30;
//    self.mail.iOS6ParallaxIntensity = 30;
    

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(5, 5, 50, 50);
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    
    
    
    // Do any additional setup after loading the view.
}

- (void)back:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    
    [super dealloc];
    [_diaoimageview release];
    [_haoimageview release];
    [_lvimageview release];
    [_diaoimageview release];
    [_haoname release];
    [_lvname release];
    [_address release];
    [_mail release];
    [_diaomail release];
    [_haomail release];
    [_lvmail release];
    [_Leader release];
    [_ui1 release];
    [_ui2 release];
    
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
