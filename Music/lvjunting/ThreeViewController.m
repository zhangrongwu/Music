//
//  ThreeViewController.m
//  find
//
//  Created by apple on 14-10-6.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "ThreeViewController.h"
#import "TwoViewController.h"
#import "Mp3PlayerButton.h"
#import "NCMusicEngine.h"
#import "MainTableViewCell.h"
#import "NetWorkHandier.h"
#import "Music.h"
#import "UIImageView+WebCache.h"
#import "JingRoundView.h"
#import "YDSlider.h"
#import "Collection.h"
#import "MusicOnLine.h"
#import "LeftViewController.h"
#import "YRSideViewController.h"
#import "FXBlurView.h"
#import "pinglun.h"
#import "SDImageCache.h"
#import "CBAutoScrollLabel.h"

//#import <AVFoundation/AVFoundation.h>

#define YDIMG(__name) [UIImage imageNamed:__name]


@interface ThreeViewController ()<NCMusicEngineDelegate,AVAudioPlayerDelegate>
{
    NCMusicEngine *_player;
}
@property (nonatomic, retain)UIImageView *background;
@property (nonatomic, retain)FXBlurView *mohu;
@property (nonatomic, retain)UIButton *jiazai;
@end

@implementation ThreeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _player = [NCMusicEngine shareInstance];
        self.array = [NSMutableArray arrayWithCapacity:0];
        self.arrOfjiaodian = [NSArray array];
//        _player.playState = NCMusicEnginePlayStatePlaying;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    
    
//    //后台播放音乐
//    AVAudioSession * session = [AVAudioSession sharedInstance];
//    [session setActive:YES error:nil];
//    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
//    
//    //让app能接受远程事件
//    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];

    //手势
    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    swip.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swip];
    [swip release];


    self.buttoncount = 0;
//    NSLog(@"%@",self.mp3);
//    NSLog(@"%@",self.ID);
//    NSLog(@"-----------%@", self.arrOfjiaodian);
    UIButton *pushbutton = [UIButton buttonWithType:UIButtonTypeSystem];
//    pushbutton.backgroundColor = [UIColor redColor];
    pushbutton.frame = CGRectMake(-10, 520, 340, 60);
    [pushbutton setTitle:@"查看评论" forState:UIControlStateNormal];
    [pushbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pushbutton setBackgroundImage:[UIImage imageNamed:@"pinglun.png"] forState:UIControlStateNormal];
    [pushbutton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    

    
    self.background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.background.image = [UIImage imageNamed:@"pifu14.JPG"];
    [self.view addSubview:self.background];
    
    self.mohu = [[FXBlurView alloc] initWithFrame:self.background.bounds];
    self.mohu.userInteractionEnabled = YES;
    self.mohu.blurEnabled = 10;
    [self.view addSubview:self.mohu];
    
    
    
    

    CBAutoScrollLabel *title = [[CBAutoScrollLabel alloc] initWithFrame:CGRectMake(20, 20, 280, 30)];
    title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:title];
    
    UIImageView *biaoceng = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 320, 30)];
    biaoceng.image = [UIImage imageNamed:@"title.png"];
    biaoceng.userInteractionEnabled = YES;
    [self.view addSubview:biaoceng];
    
    
    self.roundView = [[JingRoundView alloc]initWithFrame:CGRectMake(10, 100, 310, 300)];
    self.roundView.delegate = self;
    self.roundView.rotationDuration = 8.0;
    self.roundView.roundImage = [UIImage imageNamed:@"diao1.png"];
    self.background.image = [UIImage imageNamed:@"p7.png"];

    [self.view addSubview:self.roundView];
    
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(157, 60, 80, 120)];
    imageView.image = [UIImage imageNamed:@"diao2.png"];
    //        imageView.
    [self.view addSubview:imageView];
    [imageView release];

    self.play = [[Mp3PlayerButton alloc] initWithFrame:CGRectMake(0, 100, 310, 310)];

    self.play.playImage = [UIImage imageNamed:@"sb.png"];
    self.play.pauseImage = [UIImage imageNamed:@"sb.png"];
    [self.play setBackgroundImage:[UIImage imageNamed:@"sb.png"] forState:UIControlStateNormal];
    [self.play addTarget:self action:@selector(playAudio:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.play];
    [_player stop];
    
    
   NSString *data = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/track/detail?device=iPhone&trackId=%@", self.ID];
    
    
    [NetWorkHandier getConnectionWithURL:data comletion:^(id result) {

        
         self.images = [result objectForKey:@"coverLarge"];
//        NSLog(@"---------%@", self.images);
        

        title.text = [result objectForKey:@"title"];


        if (![self.images isKindOfClass:[NSNull class]]) {
              self.roundView.roundImage = [UIImage imageNamed:@"diao1.png"];
//            self.roundView.nv.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.images]]];
            [self.roundView.nv setImageWithURL:[NSURL URLWithString:self.images]];
//            self.background.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.images]]];
            [self.background setImageWithURL:[NSURL URLWithString:self.images]];
            
            
        } else {
            self.roundView.roundImage = [UIImage imageNamed:@"diao1.png"];
            self.background.image = [UIImage imageNamed:@"p7.png"];
        }
        self.roundView.isPlay = YES;

   [self.imageView release];
        
        
        if (self.biaoji == 10) {
            
            self.play.mp3URL = [NSURL URLWithString:self.mp3];
        } else {
            self.play.mp3URL = [NSURL URLWithString:[result objectForKey:@"playUrl64"]];
        }

        [_player playUrl:self.play.mp3URL];
        
        [self.jiazai removeFromSuperview];
//
    }];
    
    
    
    
    
    [_scrollView release];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(musicslide) userInfo:nil repeats:YES];
    
    
        self.slider3 = [[YDSlider alloc]init];
        self.slider3.frame = CGRectMake(0, 410, 320, 1);
        self.slider3.backgroundColor = [UIColor redColor];
    self.slider3.thumbTintColor = [UIColor redColor];
        self.slider3.value = 1;
//        _slider3.middleValue = 0.7;
        [_slider3 setThumbImage:YDIMG(@"player-progress-point") forState:UIControlStateNormal];
        [_slider3 setThumbImage:YDIMG(@"player-progress-point-h") forState:UIControlStateHighlighted];
        [_slider3 setMinimumTrackImage:[YDIMG(@"player-progress-h") resizableImageWithCapInsets:UIEdgeInsetsMake(4, 3, 5, 4) resizingMode:UIImageResizingModeStretch]];
         [_slider3 setMiddleTrackImage:[YDIMG(@"player-progress-loading") resizableImageWithCapInsets:UIEdgeInsetsMake(4, 3, 5, 4) resizingMode:UIImageResizingModeStretch]];
        [_slider3 setMaximumTrackImage:[YDIMG(@"player-progress") resizableImageWithCapInsets:UIEdgeInsetsMake(4, 3, 5, 4) resizingMode:UIImageResizingModeStretch]];
    [self.slider3 addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:self.slider3];
        // Do any additional setup after loading the view.
    //播放>>>>>>>>>>>>>>>>>>>>>>>>
    

    
    
    
    
    //下一曲
    self.play2 = [[Mp3PlayerButton alloc]initWithFrame:CGRectMake(200, 440, 50, 50)];
//    self.play2.mp3URL = [NSURL URLWithString:self.mp3str];
    self.play2.playImage = [UIImage imageNamed:@"next.png"];
    self.play2.pauseImage = [UIImage imageNamed:@"next.png"];
    [self.play2 setBackgroundImage:[UIImage imageNamed:@"next.png"] forState:UIControlStateNormal];
    [self.play2 addTarget:self action:@selector(playAudionext:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.play2];
    //
    //    //上一曲
    //
    self.play3 = [[Mp3PlayerButton alloc]initWithFrame:CGRectMake(70, 440, 50, 50)];
//    self.play3.mp3URL = [NSURL URLWithString:self.mp3];
    //    self.play3.hidden = NO;
    self.play3.playImage = [UIImage imageNamed:@"last.png"];
    self.play3.pauseImage = [UIImage imageNamed:@"last.png"];
    [self.play3 setBackgroundImage:[UIImage imageNamed:@"last.png"] forState:UIControlStateNormal];
    [self.play3 addTarget:self action:@selector(playAudiolade:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.play3];

    
    
    
    
//    [self.scrollView addSubview:self.tableView];
//    [_tableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:@"reuse"];

    
    // 启动
    [timer fire];
    
    
    
    //评论请求
    
    NSString *pinglun = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/track/comment?device=iPhone&pageId=1&pageSize=30&trackId=%@",self.ID];
        [NetWorkHandier getConnectionWithURL:pinglun comletion:^(id result) {
        self.dic1 = result;
    }];
    // Do any additional setup after loading the view.
    [self.view addSubview:pushbutton];
    self.temp = self.mp3index;

    
    
    
    
    
    self.jiazai = [[UIButton alloc] initWithFrame:CGRectMake(120, 300, 80, 50)];
    [self.jiazai setTitle:@"加载中..." forState:UIControlStateNormal];
    [self.jiazai setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.jiazai.backgroundColor = [UIColor whiteColor];
    self.jiazai.alpha = 0.7;
    self.jiazai.layer.cornerRadius = 10;
    [self.view addSubview:self.jiazai];
    [self.jiazai release];

    
}
- (void)buttonClicked:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"%f", scrollView.contentOffset.y);
    if (scrollView ==  self.scrollView) {
        
        self.play.frame = CGRectMake(128, 197-scrollView.contentOffset.y, 64, 64);
        self.play2.frame = CGRectMake(200, 440-scrollView.contentOffset.y, 64, 50);
        self.play3.frame = CGRectMake(70, 440-scrollView.contentOffset.y, 64, 50);
        
    }
}
//大圆转点击事件
-(void)playStatuUpdate:(BOOL)playState
{
//    NSLog(@"%@...", playState ? @"Playing": @"Pause");
    
    
}
///////////////////////下一曲////////////////////////

- (void)playAudio:(Mp3PlayerButton *)button
{
    
    if (_player == nil) {
        _player = [[NCMusicEngine alloc] init];
        //_player.button = button;
        _player.delegate = self;
    }
    
//    if ([_player.button isEqual:button]) {
        if (_player.playState == NCMusicEnginePlayStatePlaying) {
            self.roundView.isPlay = NO;
            [_player pause];
        }
        else if(_player.playState==NCMusicEnginePlayStatePaused){
            self.roundView.isPlay = YES;

            [_player resume];
        } else if (_player.playState == NCMusicEnginePlayStateEnded) {
            self.roundView.isPlay = NO;
            [_player pause];
        }else{
            [_player playUrl:button.mp3URL];
        }
//     else {
//        [_player stop];
//        self.roundView.isPlay = YES;
////        NSLog(@"开始");
//
//        _player.button = button;
//        [_player playUrl:button.mp3URL];
//    }
}

- (void)playAudionext:(Mp3PlayerButton *)button
{
        if (self.mp3index < self.arrOfjiaodian.count) {
            self.roundView.isPlay = YES;

            NSString *data = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/track/detail?device=iPhone&trackId=%@", [self.arrOfjiaodian objectAtIndex:++self.mp3index]];
            [NetWorkHandier getConnectionWithURL:data comletion:^(id result) {
                
                [_player stop];
                [_player playUrl:[NSURL URLWithString:[result objectForKey:@"playUrl64"]]];
                self.roundView.nv.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[result objectForKey:@"coverLarge"]]]];
                self.nameLabel.text = [result objectForKey:@"title"];
                self.background.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[result objectForKey:@"coverLarge"]]]];
                
            }];
        }
    
    
    
}
- (void)playAudiolade:(Mp3PlayerButton *)button
{
        if (self.mp3index > 0) {
            self.roundView.isPlay = YES;
            
            NSString *data = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/track/detail?device=iPhone&trackId=%@", [self.arrOfjiaodian objectAtIndex:--self.mp3index]];
            [NetWorkHandier getConnectionWithURL:data comletion:^(id result) {
                
                [_player stop];
                [_player playUrl:[NSURL URLWithString:[result objectForKey:@"playUrl64"]]];
                self.roundView.nv.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[result objectForKey:@"coverLarge"]]]];
                self.nameLabel.text = [result objectForKey:@"title"];
                self.background.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[result objectForKey:@"coverLarge"]]]];
            
            }];
        }
        
    
    
    
}

- (void)sliderAction:(UISlider *)slider
{
    _player.player.currentTime = slider.value*_player.player.duration ;

//    NSLog(@"滚动条绑定事件");
    
}
//音乐播放
- (void)musicslide
{
//    NSLog(@"%f",self.play.progress);
    self.slider3.value = _player.player.currentTime/_player.player.duration;
    if (self.slider3.value == 1) {
            self.roundView.isPlay = NO;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    return self.arr.count;
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *a = @"dad";
    MainTableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:a];
    if (myCell == nil) {
        myCell = [[MainTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:a];
        
    }
    
    Music *eve = [self.array objectAtIndex:indexPath.row];
    myCell.nameLabel.text = eve.peopleName;
    
    myCell.replyLabel.text = eve.content;

//    NSLog(@"%@",eve.peopleName);
//    NSLog(@"%@",myCell.nameLabel.text);
    id imageStr = eve.smallHeader;//照片
    if (imageStr == [NSNull null] ) {
        myCell.pictImageView.image = [UIImage imageNamed:@"1.jpeg"];
//        NSLog(@"%@",imageStr);
        
    }else
    {
        NSURL *url = [NSURL URLWithString:imageStr];
        [myCell.pictImageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"zhanwei.png"]];
        
    }
    
    return myCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}



- (void)swipeAction:(UISwipeGestureRecognizer *)swipe
{
    
//    NSLog(@"向左");
    //    a.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 单例实现
//static ThreeViewController *sharedObj = nil;
//+ (ThreeViewController*) sharedInstance  //第二步：实例构造检查静态实例是否为nil
//
//{
//    
//    @synchronized (self)
//    
//    {
//        
//        if (sharedObj == nil)
//            
//        {
//            
//            [[self alloc] init];
//            
//        }
//        
//    }
//    
//    return sharedObj;
//    
//}
//
//
//
//+ (id) allocWithZone:(NSZone *)zone //第三步：重写allocWithZone方法
//
//{
//    
//    @synchronized (self) {
//        
//        if (sharedObj == nil) {
//            
//            sharedObj = [super allocWithZone:zone];
//            
//            return sharedObj;
//            
//        }
//        
//    }
//    
//    return nil;
//    
//}
//
//
//
//- (id) copyWithZone:(NSZone *)zone //第四步
//
//{
//    
//    return self;
//    
//}
//
//
//
//- (id) retain
//
//{
//    
//    return self;
//    
//}
//
//
//
//- (unsigned) retainCount
//
//{
//    
//    return UINT_MAX;
//    
//}
//
//
//
//- (oneway void) release
//
//{
//    
//    
//}
//
//
//
//- (id) autorelease
//
//{
//    
//    return self;
//    
//}
//
//
//- (id)init
//
//{
//    
//    @synchronized(self) {
//        
//        [super init];//往往放一些要初始化的变量.
//        
//        return self;
//        
//    }
//}
//#pragma mark -


- (void)viewWillAppear:(BOOL)animated
{
//    self.biaoji = 1;
//    if (self.danlibiaoji !=1) {
//        
//        [self viewDidLoad];
//    }
}

- (void)click:(UIButton *)button
{
    
//    NSLog(@"^^^^^^^^^^^^^^^^^^^^^^^^");
    
    
    NSMutableArray *ar = [NSMutableArray array];
    ar = [self.dic1 objectForKey:@"list"];
    pinglun *ping = [[pinglun alloc]init];
    [ping setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    ping.ID = self.ID;
    ping.beijing = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.images]]];
    if (ar.count == 0) {
        UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"提示" message:@"暂无评论" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
        [a show];
    } else {
        
        [self presentViewController:ping animated:YES completion:^{
            
        }];
    }
//    [self.navigationController pushViewController:ping animated:YES];
    [ping release];
    
}

- (void)dealloc
{
    [super dealloc];
    [_player release];
    [_background release];
    [_mp3 release];
    [_scrollView release];
    [_images release];
    [_imageView release];
    [_smallimageview release];
    [_nameLabel release];
    [_musicLabel release];
    [_ID release];
    [_tableView release];
    [_slider3 release];
    [_play release];
    [_array release];
    [_dic1 release];
    [_smallview release];
    [_roundView release];
    [_button release];
    [_play2 release];
    [_play3 release];
    [_string release];
    [_mp3str release];
    [_arrOfjiaodian release];
    [_view1 release];
    [_arrrr release];
    [_mohu release];

}

//响应 远程控制 事件
//-(void)remoteControlReceivedWithEvent:(UIEvent *)event
//{
//    if (event.type == UIEventTypeRemoteControl) {
//        
//        switch (event.subtype) {
//            case UIEventSubtypeRemoteControlPause:
//                
//                [_player pause];
//                NSLog(@"zanting");
//                
//                break;
//                
//            case UIEventSubtypeRemoteControlPlay:
//                NSLog(@"kaizhi");
//                [_player resume];
//                break;
//                
//            case UIEventSubtypeRemoteControlPreviousTrack:
//                NSLog(@"上一曲");
//                break;
//                
//            case UIEventSubtypeRemoteControlNextTrack:
//                NSLog(@"下一曲");
//                break;
//                
//                
//            default:
//                break;
//        }
//    }
//}
//
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
