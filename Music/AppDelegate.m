//
//  AppDelegate.m
//  Music
//
//  Created by lothario on 14-9-29.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import "AppDelegate.h"
#import "MusicOnLine.h"
#import "UIButton+NMCategory.h"
#import "LeftViewController.h"
#import "YRSideViewController.h"

#import "WeiboApi.h"
#import "WeiboSDK.h"

#import <ShareSDK/ShareSDK.h>
#import <Parse/Parse.h>
#import "Collection.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(suibian:) name:@"denglu" object:nil];

    [center addObserver:self selector:@selector(suibian000:) name:@"huifu" object:nil];

    
    MusicOnLine *musicOnLineVC = [[MusicOnLine alloc] init];
    LeftViewController *leftVC = [[LeftViewController alloc] init];
    Collection *collectionVC = [[Collection alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:musicOnLineVC];
    //
    //
    
//    UINavigationController *naviyou = [[UINavigationController alloc] initWithRootViewController:collectionVC];
    self.ChouTi = [[YRSideViewController alloc] init];
    self.ChouTi.rootViewController = navi;
    self.ChouTi.leftViewController = leftVC;
    self.ChouTi.rightViewController = collectionVC;
    self.ChouTi.leftViewShowWidth = 200;
    self.ChouTi.needSwipeShowMenu = true;
    
    
    
    
    
//    [self.navigationController pushViewController:ChouTi animated:YES];
    
    
    
//    LoginViewController *loginVC = [[LoginViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = self.ChouTi;
    
    
    
    
    
    
    
    [ShareSDK registerApp:@"783b9ac2495"];
    [ShareSDK connectSinaWeiboWithAppKey:@"568898243"
                               appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                             redirectUri:@"http://www.sharesdk.cn"];
    
    [Parse setApplicationId:@"Ny5b46aizKwe76dRn1d1NC7CJsXS4g9WE3Brfj30"
                  clientKey:@"eq3p6oqel4vuUxq3Kgr3LyNUbOtnHB7xdC3DqFE5"];
    
    
    
    
    //添加新浪微博应用 注册网址 http://open.weibo.com
    [ShareSDK connectSinaWeiboWithAppKey:@"689572657"
                               appSecret:@"7d8c3b97dac5dd4cd9491b4c0f8291cb"
                             redirectUri:@"http://www.lanou3g.com"];
    //当使用新浪微博客户端分享的时候需要按照下面的方法来初始化新浪的平台
    [ShareSDK  connectSinaWeiboWithAppKey:@"689572657"
                                appSecret:@"7d8c3b97dac5dd4cd9491b4c0f8291cb"
                              redirectUri:@"http://www.lanou3g.com"
                              weiboSDKCls:[WeiboSDK class]];
    
//    //添加腾讯微博应用 注册网址 http://dev.t.qq.com
//    [ShareSDK connectTencentWeiboWithAppKey:@"801307650"
//                                  appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c"
//                                redirectUri:@"http://www.sharesdk.cn"
//                                   wbApiCls:[WeiboApi class]];
    
//
//    
//    //添加网易微博应用 注册网址  http://open.t.163.com
//    [ShareSDK connect163WeiboWithAppKey:@"T5EI7BXe13vfyDuy"
//                              appSecret:@"gZxwyNOvjFYpxwwlnuizHRRtBRZ2lV1j"
//                            redirectUri:@"http://www.shareSDK.cn"];
//    
//    //添加搜狐微博应用  注册网址  http://open.t.sohu.com
//    [ShareSDK connectSohuWeiboWithConsumerKey:@"SAfmTG1blxZY3HztESWx"
//                               consumerSecret:@"yfTZf)!rVwh*3dqQuVJVsUL37!F)!yS9S!Orcsij"
//                                  redirectUri:@"http://www.sharesdk.cn"];
//    
//    //添加豆瓣应用  注册网址 http://developers.douban.com
//    [ShareSDK connectDoubanWithAppKey:@"07d08fbfc1210e931771af3f43632bb9"
//                            appSecret:@"e32896161e72be91"
//                          redirectUri:@"http://dev.kumoway.com/braininference/infos.php"];
//    
//    
//    //添加开心网应用  注册网址 http://open.kaixin001.com
//    [ShareSDK connectKaiXinWithAppKey:@"358443394194887cee81ff5890870c7c"
//                            appSecret:@"da32179d859c016169f66d90b6db2a23"
//                          redirectUri:@"http://www.sharesdk.cn/"];
//    
//    //添加Instapaper应用   注册网址  http://www.instapaper.com/main/request_oauth_consumer_token
//    [ShareSDK connectInstapaperWithAppKey:@"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA"
//                                appSecret:@"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"];
//    
//    //添加有道云笔记应用  注册网址 http://note.youdao.com/open/developguide.html#app
//    [ShareSDK connectYouDaoNoteWithConsumerKey:@"dcde25dca105bcc36884ed4534dab940"
//                                consumerSecret:@"d98217b4020e7f1874263795f44838fe"
//                                   redirectUri:@"http://www.sharesdk.cn/"];
//    
//    //添加Facebook应用  注册网址 https://developers.facebook.com
//    [ShareSDK connectFacebookWithAppKey:@"107704292745179"
//                              appSecret:@"38053202e1a5fe26c80c753071f0b573"];
//    
//    //添加Twitter应用  注册网址  https://dev.twitter.com
//    [ShareSDK connectTwitterWithConsumerKey:@"mnTGqtXk0TYMXYTN7qUxg"
//                             consumerSecret:@"ROkFqr8c3m1HXqS3rm3TJ0WkAJuwBOSaWhPbZ9Ojuc"
//                                redirectUri:@"http://www.sharesdk.cn"];
//    
//    //添加搜狐随身看应用 注册网址  https://open.sohu.com
//    [ShareSDK connectSohuKanWithAppKey:@"e16680a815134504b746c86e08a19db0"
//                             appSecret:@"b8eec53707c3976efc91614dd16ef81c"
//                           redirectUri:@"http://sharesdk.cn"];
//    
//    //添加Pocket应用  注册网址  http://getpocket.com/developer/
//    [ShareSDK connectPocketWithConsumerKey:@"11496-de7c8c5eb25b2c9fcdc2b627"
//                               redirectUri:@"pocketapp1234"];
//    
//    //添加印象笔记应用   注册网址  http://dev.yinxiang.com
//    [ShareSDK connectEvernoteWithType:SSEverNoteTypeSandbox
//                          consumerKey:@"sharesdk-7807"
//                       consumerSecret:@"d05bf86993836004"];
//    
//    //添加LinkedIn应用  注册网址 https://www.linkedin.com/secure/developer
//    [ShareSDK connectLinkedInWithApiKey:@"ejo5ibkye3vo"
//                              secretKey:@"cC7B2jpxITqPLZ5M"
//                            redirectUri:@"http://sharesdk.cn"];
    
    
    
    
    
    
    
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(130, 345,60, 60)];
//    [btn setImage:[UIImage imageNamed:@"010.png"] forState:UIControlStateNormal];
//    btn.tag = 0;
//    btn.layer.cornerRadius = 8;
//    [btn setDragEnable:YES];
//    [btn setAdsorbEnable:YES];
//    [self.window addSubview:btn];
//    [btn addTarget:self action:@selector(showTag:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
//    [navi release];
//    [musicOnLineVC release];
    [_window release];
    return YES;
}
- (void)suibian000:(NSNotification *)noti
{
    //    self.contentView.backgroundColor = ;
    [self.ChouTi hideSideViewController:YES];
}

//浮动按钮
//-(void)showTag:(UIButton *)sender
//{
////    NSLog(@"button.tag >> %@",@(sender.tag));
//    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//    
//    //参数1:给哪个对象发送通知
//    //参数2:发送的通知可以带一个参数
//    //参数3:如果传多个参数, 就拼一个字典, 填入第三个参数中
//    
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"value", @"key", nil];
//    [center postNotificationName:@"厕所" object:@"附带的参数" userInfo:dic];
//
//}

//- (void)viewDidUnload
//{
//    [super viewDidUnload];
//    // Release any retained subviews of the main view.
//}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void)dealloc
{
    [_window release];
    [super dealloc];
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url wxDelegate:nil];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    return [ShareSDK handleOpenURL:url
                 sourceApplication:sourceApplication
                        annotation:annotation
                        wxDelegate:nil];
    
}

- (void)suibian:(NSNotification *)noti
{
    [self.ChouTi hideSideViewController:YES];
}

@end
