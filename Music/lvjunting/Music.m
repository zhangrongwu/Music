//
//  Music.m
//  find
//
//  Created by apple on 14-9-30.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "Music.h"
#import "NCMusicEngine.h"
#import "Mp3PlayerButton.h"
#import "TwoViewController.h"

@interface Music ()

@end



//static Music *instance = nil;

@implementation Music




- (void)dealloc
{
    [_cover_pathimage release];
    [_titlelabel release];
    [_nicknamelabel release];
    [_count_playlabel release];
    [_count_likelabel release];
    [_play_path_64music release];
    [_ID release];
    [_peopleName release];
    [_content release];
    [_smallHeader release];

    [super dealloc];
    
}

- (id)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.cover_pathimage = [dic objectForKey:@"cover_path"];
        self.titlelabel = [dic objectForKey:@"title"];
        self.nicknamelabel = [dic objectForKey:@"nickname"];
        self.count_likelabel = [dic objectForKey:@"count_like"];
        self.count_playlabel = [dic objectForKey:@"count_play"];
        self.play_path_64music = [dic objectForKey:@"play_path_64"];
        self.count_commentlabel = [dic objectForKey:@"count_comment"];
        self.ID = [dic objectForKey:@"id"];
        self.peopleName = [dic objectForKey:@"nickname"];
        self.content = [dic objectForKey:@"content"];
        self.smallHeader = [dic objectForKey:@"smallHeader"];
    }
    
    return self;
    
}


+ (NSMutableArray *)modelsFromDics:(NSArray *)arr
{
    NSMutableArray *modelsArr = [NSMutableArray array];
    
    
    for (NSDictionary *dic in arr) {
        
        Music *event = [[self alloc] initWithDictionary:dic];
        [modelsArr addObject:event];
        [event release];
        
    }
    
    return modelsArr;
    
}







@end
