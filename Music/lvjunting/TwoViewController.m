//
//  TwoViewController.m
//  find
//
//  Created by apple on 14-9-30.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "TwoViewController.h"
#import "cell.h"
#import "UIImageView+WebCache.h"
#import "NetWorkHandier.h"
#import "Music.h"
#import "OneViewController.h"
#import "Mp3PlayerButton.h"
#import "NCMusicEngine.h"
#import "ThreeViewController.h"
#import "SecondViewController.h"
#import "CExpandHeader.h"
#import "FXBlurView.h"


@interface TwoViewController ()<NCMusicEngineDelegate>
{
    NCMusicEngine *_player;
}
@property (nonatomic, retain)UIImageView *background;
@property (nonatomic, retain)UIButton *jiazai;
@end

@implementation TwoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.arrOfList = [[NSMutableArray alloc] init];
        self.dicOfType = [NSMutableDictionary dictionary];
        self.array = [NSMutableArray arrayWithCapacity:0];
        self.arrID = [NSMutableArray arrayWithCapacity:0];
        //单例
        _player = [NCMusicEngine shareInstance];
//        self.view.backgroundColor = [UIColor whiteColor];
        self.navigationController.navigationBarHidden = YES;
        
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
//    self.tableview.backgroundView = nil;
    self.background.image = nil;

    self.view.backgroundColor = [UIColor colorWithRed:0.63 green:0.17 blue:0.43 alpha:1];

    
}
- (void)suibian2:(NSNotification *)noti
{
    //    self.contentView.backgroundColor = ;
    
//    self.tableview.backgroundView = nil;
    self.background.image = nil;
    self.view.backgroundColor = [UIColor colorWithRed:0.00 green:0.55 blue:0.78 alpha:1];

}
- (void)suibian3:(NSNotification *)noti
{
    //    self.contentView.backgroundColor = ;
    static int a = 1;
    self.background.image = [UIImage imageNamed:[NSString stringWithFormat:@"pifu%d.JPG", a]];
    if (a==38) {
        a = 1;
    }
    a++;
}
- (void)suibian4:(NSNotification *)noti
{
    //    self.contentView.backgroundColor = ;
    
//    self.tableview.backgroundView = nil;
    self.background.image = nil;

    self.view.backgroundColor = [UIColor orangeColor];
}
- (void)suibian5:(NSNotification *)noti
{
    //    self.contentView.backgroundColor = ;
//    self.tableview.backgroundView = nil;
    self.background.image = nil;

    self.view.backgroundColor = [UIColor blackColor];

}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.biaoji == 2) {
        
        return self.array.count;
    }else
        return [self.arrOfList count];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor blackColor];
    self.background = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.background.image = [UIImage imageNamed:@"pifu14.JPG"];
    [self.view addSubview:self.background];
    self.jiazai = [[UIButton alloc] initWithFrame:CGRectMake(120, 300, 80, 50)];
    [self.jiazai setTitle:@"加载中..." forState:UIControlStateNormal];
    [self.jiazai setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.jiazai.backgroundColor = [UIColor whiteColor];
    self.jiazai.alpha = 0.7;
    self.jiazai.layer.cornerRadius = 10;
    [self.background addSubview:self.jiazai];
    [self.jiazai release];

    
//    FXBlurView *mohu = [[FXBlurView alloc] initWithFrame:self.view.bounds];
//    mohu.userInteractionEnabled = YES;
//    mohu.blurEnabled = 10;
//    [self.view addSubview:mohu];

    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 10, 320, 560) style:UITableViewStyleGrouped];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
//    self.tableview.alpha = 0.5;
    self.tableview.backgroundColor = [UIColor clearColor];
    self.tableview.backgroundView = nil;
//    self.tableview.backgroundView = 0;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.bounces = NO;
    [self.view addSubview:self.tableview];
    //手势
//    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
//    swipe.direction =  UISwipeGestureRecognizerDirectionLeft;
//    swipe.direction = UISwipeGestureRecognizerDirectionRight;
//    //    swipe.direction = UISwipeGestureRecognizerDirectionDown;
//    //    swipe.direction = UISwipeGestureRecognizerDirectionUp;
//    [self.tableview addGestureRecognizer:swipe];
//    [swipe release];
    
        self.topView = [[UIView alloc]init];
        self.topView.backgroundColor =  [UIColor clearColor];
    self.topView.frame = CGRectMake(0, 0, 320, 70);
        [self.view addSubview:self.topView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 10, 50, 30);
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    if (self.biaoji == 1) {
        UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"最火",@"最近更新",@"经典"]];
        segment.frame = CGRectMake(10, 40, 300, 25);
        //    segment.backgroundColor = [10 whiteColor];
        segment.tintColor = [UIColor whiteColor];
        [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
        [self.topView addSubview:segment];
        [segment release];
//        CExpandHeader *head = [CExpandHeader expandWithScrollView:self.tableview expandView:viewtop];
        
    }else{
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(120, 30, 300, 25)];
        label.text = @"搜索结果";
        label.textColor = [UIColor whiteColor];
        [self.topView addSubview:label];
    }

    
    
    if (_biaoji == 2) {
        
        [NetWorkHandier getConnectionWithURL:self.string comletion:^(id result) {
            self.dic1 = result;
            NSMutableArray *eventDics = [[result objectForKey:@"response"]objectForKey:@"docs"];
            for (NSDictionary *dic in eventDics) {
                Music *eve = [[Music alloc]initWithDictionary:dic];/////////id
                [self.array addObject:eve];
                NSString *str = [dic objectForKey:@"id"];
                [self.arrID addObject:str];
                [eve release];
                [self.jiazai removeFromSuperview];
                [self.tableview reloadData];
            }
            
        }];
    } else if (self.biaoji == 1) {
        [NetWorkHandier getConnectionWithURL:[NSString stringWithFormat:@"http://mobile.ximalaya.com/m/explore_album_list?category_name=music&condition=hot&device=iPhone&page=1&per_page=20&status=0&tag_name=%@", self.nameOfType] comletion:^(id result) {
            self.dicOfType = result;
            self.arrOfList = [self.dicOfType objectForKey:@"list"];
//            NSLog(@"%@", self.arrOfList);
            [self.jiazai removeFromSuperview];
            [self.tableview reloadData];
        }];
    }
    
//    NSLog(@"标记%d", self.biaoji);

    
    // Do any additional setup after loading the view.
}

//向右滑

//- (void)swipeAction:(UISwipeGestureRecognizer *)swipe
//{
//
//        NSLog(@"向左");
//    a.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self.navigationController popViewControllerAnimated:YES];
//
//
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.topView.frame = CGRectMake(0, 0-scrollView.contentOffset.y, 320, 70);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *a = @"dad";
    cell *myCell = [tableView dequeueReusableCellWithIdentifier:a];
    myCell.backgroundColor = [UIColor clearColor];
    if (myCell == nil) {
        myCell = [[cell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:a];
        
    }
    
    if (self.biaoji == 2) {
        //主题
        //    NSLog(@"%@",self.string);
        //变色
        myCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        Music *eve = [self.array objectAtIndex:indexPath.row];
        myCell.titlelabel.text = eve.titlelabel;
        
        
        //类里面的音乐
        self.musicStr = eve.play_path_64music;
        NSURL *url = [NSURL URLWithString:self.musicStr];
        //button里的事
        myCell.playButton.mp3URL = [NSURL URLWithString:self.musicStr];
        //        NSLog(@"%@",a);
        //点击button调用时间
        [myCell.playButton addTarget:self action:@selector(playAudio:) forControlEvents:UIControlEventTouchUpInside];
//        NSLog(@"%@",url);
        //by
        myCell.nicknamelabel.text = eve.nicknamelabel;
        //播放过的次数
        NSNumber *number = eve.count_playlabel;
        NSString *numberStr = [NSString string];
        NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
        numberStr = [numberFormatter stringFromNumber:number];
        NSString *str =  [NSString stringWithFormat:@"%.1f万",[numberStr floatValue]/10000];
        myCell.count_playlabel.text = str;
        [numberFormatter release];
        //    NSLog(@"^^^^^^^^^%@",number);
        //赞过的次数
        NSNumber *number2 = eve.count_likelabel;
        NSString *numberStr2 = [NSString string];
        NSNumberFormatter* numberFormatter2 = [[NSNumberFormatter alloc] init];
        numberStr2 = [numberFormatter2 stringFromNumber:number2];
        myCell.count_likelabel.text = numberStr2;
        [numberFormatter2 release];
        
        //评论次数
        NSNumber *number3 = eve.count_commentlabel;
        NSString *numberStr3 = [NSString string];
        NSNumberFormatter *numberFormatter3 = [[NSNumberFormatter alloc]init];
        numberStr3 = [numberFormatter3 stringFromNumber:number3];
        myCell.count_commentlabel.text = numberStr3;
        [numberFormatter3 release];
        
        
        id imageStr = eve.cover_pathimage;//照片
        if (imageStr == [NSNull null] ) {
//            myCell.cover_pathimage.image = [UIImage imageNamed:@"zhanwei.png"];

            myCell.cover_pathimage.image = [UIImage imageNamed:@"暂无.jpeg"];
            //        NSLog(@"%@",imageStr);
            
        }else
        {
//            myCell.cover_pathimage.image = [UIImage imageNamed:@"zhanwei.png"];
            NSURL *url = [NSURL URLWithString:imageStr];
            [myCell.cover_pathimage setImageWithURL:url placeholderImage:[UIImage imageNamed:@"zhanwei.png"]];
            
        }
        
        
        
        myCell.player.image = [UIImage imageNamed:@"9.png"];
        myCell.nice.image = [UIImage imageNamed:@"8.png"];
        myCell.speak.image = [UIImage imageNamed:@"7.png"];
        
    }
    else {
        [myCell.playButton removeFromSuperview];
        myCell.titlelabel.text = [[self.arrOfList objectAtIndex:indexPath.row] objectForKey:@"title"];
//        NSLog(@"=====%@", myCell.titlelabel.text);
        myCell.dianjiliang.image = [UIImage imageNamed:@"9.png"];
        myCell.nicknamelabel.text = [NSString stringWithFormat:@"%.1f万", [[[self.arrOfList objectAtIndex:indexPath.row] objectForKey:@"playsCounts"] floatValue]/10000];
        NSString *strurl = [[self.arrOfList objectAtIndex:indexPath.row] objectForKey:@"albumCoverUrl290"];
        if ([strurl isKindOfClass:[NSNull class]]) {
            
        }else{
//            myCell.cover_pathimage.image = [UIImage imageNamed:@"zhanwei.png"];

            [myCell.cover_pathimage setImageWithURL:[NSURL URLWithString:strurl] placeholderImage:[UIImage imageNamed:@"zhanwei.png"]];
        }
        myCell.zhuanji.image = [UIImage imageNamed:@"zhuanji.png"];
    }
    
    
    return myCell;
}

- (void)back:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.biaoji == 1) {
        return 35;
    } else
        return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (self.biaoji == 1) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:@"加载更多" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(jiazai:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 320, 100);
        return button;
    } else
        return nil;
}

- (void)jiazai:(UIButton *)button
{
    if (self.biaoji == 1) {
        static int a = 2;
        if (a < 10) {            
            [NetWorkHandier getConnectionWithURL:[NSString stringWithFormat:@"http://mobile.ximalaya.com/m/explore_album_list?category_name=music&condition=hot&device=iPhone&page=%d&per_page=20&status=0&tag_name=%@", a, self.nameOfType] comletion:^(id result) {
                self.dicOfType = result;
                NSArray *arr = [self.dicOfType objectForKey:@"list"];
                for (NSDictionary *a in arr) {
                    [self.arrOfList addObject:a];
                }
                [self.tableview reloadData];
                a++;
            }];
        }

    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}

- (void)segmentAction:(UISegmentedControl *)seg
{
    //被选中的分段序号
//    NSLog(@"%d",seg.selectedSegmentIndex);
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(120, 300, 80, 50)];
    [button setTitle:@"加载中..." forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    button.alpha = 0.7;
    button.layer.cornerRadius = 10;
    [self.view addSubview:button];
    [button release];
    if (seg.selectedSegmentIndex == 0) {
        [NetWorkHandier getConnectionWithURL:[NSString stringWithFormat:@"http://mobile.ximalaya.com/m/explore_album_list?category_name=music&condition=hot&device=iPhone&page=1&per_page=20&status=0&tag_name=%@", self.nameOfType] comletion:^(id result) {
            self.dicOfType = result;
            self.arrOfList = [self.dicOfType objectForKey:@"list"];
            [button removeFromSuperview];
            [self.tableview reloadData];
        }];
        
    }else if (seg.selectedSegmentIndex == 1) {
        [NetWorkHandier getConnectionWithURL:[NSString stringWithFormat:@"http://mobile.ximalaya.com/m/explore_album_list?category_name=music&condition=recent&device=iPhone&page=1&per_page=20&status=0&tag_name=%@", self.nameOfType] comletion:^(id result) {
            self.dicOfType = result;
            self.arrOfList = [self.dicOfType objectForKey:@"list"];

            [button removeFromSuperview];

            [self.tableview reloadData];
        }];

    } else if (seg.selectedSegmentIndex == 2) {
        [NetWorkHandier getConnectionWithURL:[NSString stringWithFormat:@"http://mobile.ximalaya.com/m/explore_album_list?category_name=music&condition=classic&device=iPhone&page=1&per_page=20&status=0&tag_name=%@", self.nameOfType] comletion:^(id result) {
            self.dicOfType = result;
            self.arrOfList = [self.dicOfType objectForKey:@"list"];

            [button removeFromSuperview];

            [self.tableview reloadData];
        }];

    }
}

- (void)playAudio:(Mp3PlayerButton *)button
{
    
//    if (_player == nil) {
//        _player = [[NCMusicEngine alloc] init];
//        //_player.button = button;
//        _player.delegate = self;
//    }
    
    if ([_player.button isEqual:button]) {
        if (_player.playState == NCMusicEnginePlayStatePlaying) {
            [_player pause];
        }
        else if(_player.playState==NCMusicEnginePlayStatePaused){
            [_player resume];
        }
        else{
            [_player playUrl:button.mp3URL];
        }
    }else {
        [_player stop];
        _player.button = button;
        [_player playUrl:button.mp3URL];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.biaoji == 2) {
        ThreeViewController *three = [[ThreeViewController alloc]init];
        Music *eve = [self.array objectAtIndex:indexPath.row];
        three.mp3 = eve.play_path_64music;
        three.ID = eve.ID;
        three.arrOfjiaodian = self.arrID;
        three.mp3index = indexPath.row;
//        three.biaoji = 10;
        //    NSLog(@"%@",three.imagestr);
        
        [three setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        
        
        [self presentViewController:three animated:YES completion:^{
            
        }];

        
//        [self.navigationController pushViewController:three animated:YES];
        
    } else if (self.biaoji == 1) {
        SecondViewController *secondVC = [[SecondViewController alloc] init];
        secondVC.biaoji = 1;
        secondVC.idOfMusic = [[self.arrOfList objectAtIndex:indexPath.row] objectForKey:@"id"];
        [self.navigationController pushViewController:secondVC animated:YES];
        [secondVC release];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    [super dealloc];
//    [_player release];
    [_background release];
    [_array release];
    [_string release];
    [_cover_pathimage release];
    [_dic1 release];
    [_tableview release];
    [_musicStr release];
    [_nameOfType release];
    [_dicOfType release];
    [_arrOfList release];
    [_topView release];
    [_arrID release];
}
//- (void)suibian1:(NSNotification *)noti
//{
//    //    self.contentView.backgroundColor = ;
//    
//    //    UIView *view = [self.view viewWithTag:20];
//    //    UIView *view2 = [self.view viewWithTag:30];
//    self.backgroundColor = [UIColor colorWithRed:0.63 green:0.17 blue:0.43 alpha:1];
//    //    view2.backgroundColor = [UIColor colorWithRed:0.63 green:0.17 blue:0.43 alpha:1];
//    
//}
//- (void)suibian2:(NSNotification *)noti
//{
//    //    self.contentView.backgroundColor = ;
//    
//    self.backgroundColor = [UIColor colorWithRed:0.00 green:0.55 blue:0.78 alpha:1];
//    
//}
//- (void)suibian3:(NSNotification *)noti
//{
//    //    self.contentView.backgroundColor = ;
//    
//    self.backgroundColor = [UIColor colorWithRed:1.00 green:0.36 blue:0.39 alpha:1];
//    
//}
//- (void)suibian4:(NSNotification *)noti
//{
//    //    self.contentView.backgroundColor = ;
//    
//    //    self.backgroundColor = [UIColor colorWithRed:0.50 green:0.82 blue:0.39 alpha:1];
//    self.backgroundColor = [UIColor orangeColor];
//    
//}
//- (void)suibian5:(NSNotification *)noti
//{
//    //    self.contentView.backgroundColor = ;
//    
//    self.backgroundColor = [UIColor blackColor];
//    
//}




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
