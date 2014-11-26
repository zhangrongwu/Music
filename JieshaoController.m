//
//  JieshaoController.m
//  Music
//
//  Created by lothario on 14-10-16.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import "JieshaoController.h"
#import "PhotoAlbum.h"
@interface JieshaoController ()


@end
@implementation JieshaoController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSArray *aaa = @[@"0001.png",@"0002.png",@"0003.png", @"0004.png", @"0005.jpg", @"0006.png", @"0007.jpg"];
    PhotoAlbum *photos = [[PhotoAlbum alloc] initWithFrame:self.view.bounds images:aaa stype:FromLeftToRight];
    [self.view addSubview:photos];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(10, 30, 50, 50);
    [button setTitle:@"返回" forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor <#color#>];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    
}
- (void)buttonClicked:(UIButton *)button
{
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
