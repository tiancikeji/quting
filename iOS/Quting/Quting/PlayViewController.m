//
//  PlayViewController.m
//  Quting
//
//  Created by Johnil on 13-5-30.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import "PlayViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ListViewController.h"
@interface PlayViewController ()

@end

@implementation PlayViewController {
    UISlider *slider;
    UIButton *pre;
    UIButton *play;
    UIButton *next;
    UILabel *currentTime;
    UILabel *totalTime;
    
    UIView *coverView;
    ListViewController *listView;
    UIButton *listBtn;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1];
//    NSString *audioPath = @"http://tome-file.b0.upaiyun.com/Inmysong.mp3";
//    [[AudioManager defaultManager] playWithURL:audioPath];
    [[AudioManager defaultManager] addListener:self];
    int height = self.view.frame.size.height-200;
    int size = isiPhone5?270:230;
    
    listView = [[ListViewController alloc] initWithModel:ListModel_play];
    listView.view.alpha = 0;
    listView.view.frame = CGRectMake(0, 0, 320, height+50);
    [self.view addSubview:listView.view];
    [listView loadDatas:@[@{@"title":@"我的歌声里", @"detailTitle":@"原声带第一首", @"isFav":@(NO), @"duration":@"05:20", @"isCurrent":@(NO)},
     @{@"title":@"我的歌声里", @"detailTitle":@"原声带第二首", @"isFav":@(YES), @"duration":@"05:50", @"isCurrent":@(NO)},
     @{@"title":@"我的歌声里", @"detailTitle":@"原声带第三首", @"isFav":@(NO), @"duration":@"04:25", @"isCurrent":@(YES)},
     @{@"title":@"我的歌声里", @"detailTitle":@"原声带第四首", @"isFav":@(YES), @"duration":@"02:27", @"isCurrent":@(NO)},
     @{@"title":@"我的歌声里", @"detailTitle":@"原声带第五首", @"isFav":@(NO), @"duration":@"06:32", @"isCurrent":@(NO)}]];
    
    coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    coverView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:coverView];
    
    UIView *coverBG = [[UIView alloc] initWithFrame:CGRectMake(15-5, (isiPhone5?30:15)-5, size+10, size+10)];
    coverBG.backgroundColor = [UIColor whiteColor];
    coverBG.center = CGPointMake(self.view.center.x, coverBG.center.y);
    coverBG.layer.cornerRadius = (size+10)/2;
    
    UIView *smallCoverBG = [[UIView alloc] initWithFrame:CGRectMake(coverBG.frame.origin.x+coverBG.frame.size.width-70, coverBG.frame.origin.y+coverBG.frame.size.height-70, 60, 60)];
    smallCoverBG.backgroundColor = [UIColor whiteColor];
    smallCoverBG.layer.cornerRadius = 30;
    [coverView addSubview:smallCoverBG];
    
    [coverView addSubview:coverBG];
    
    UIImageView *cover = [[UIImageView alloc] initWithImage:imageNamed(@"thumb.jpg")];
    cover.frame = CGRectMake(5, 5, size, size);
//    cover.center = coverBG.center;
    cover.contentMode = UIViewContentModeScaleAspectFit;
    cover.clipsToBounds = YES;
    cover.layer.cornerRadius = size/2;
    [coverBG addSubview:cover];
    
    UIView *smallCover1 = [[UIView alloc] initWithFrame:CGRectMake(smallCoverBG.frame.origin.x+4, smallCoverBG.frame.origin.y+4, smallCoverBG.frame.size.width-8, smallCoverBG.frame.size.height-8)];
    smallCover1.backgroundColor = [UIColor whiteColor];
    smallCover1.layer.cornerRadius = (smallCoverBG.frame.size.height-10)/2;
    smallCover1.clipsToBounds = YES;
    [coverView addSubview:smallCover1];
    
    UIView *smallCover = [[UIView alloc] initWithFrame:CGRectMake(smallCoverBG.frame.origin.x+5, smallCoverBG.frame.origin.y+5, smallCoverBG.frame.size.width-10, smallCoverBG.frame.size.height-10)];
    smallCover.backgroundColor = [UIColor whiteColor];
    smallCover.layer.cornerRadius = (smallCoverBG.frame.size.height-10)/2;
    smallCover.clipsToBounds = YES;
    [coverView addSubview:smallCover];

    UIImageView *cover2 = [[UIImageView alloc] initWithImage:imageNamed(@"thumb.jpg")];
    cover2.frame = CGRectMake(coverBG.frame.origin.x-smallCover.frame.origin.x+5, coverBG.frame.origin.y-smallCover.frame.origin.y+5, size, size);
    cover2.contentMode = UIViewContentModeScaleAspectFit;
    cover2.alpha = .8;
    [smallCover addSubview:cover2];
    
    UIImageView *heart = [[UIImageView alloc] initWithImage:imageNamed(@"fav.png")];
    heart.frame = CGRectMake(18, 20, 14, 13);
    [smallCover addSubview:heart];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15, coverBG.frame.origin.y+coverBG.frame.size.height-16, 150, 16)];
    title.backgroundColor = [UIColor clearColor];
    title.text = @"我的歌声里";
    title.font = [UIFont boldSystemFontOfSize:14];
    title.textColor = [UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:1];
    [coverView addSubview:title];
    
    UILabel *detailTitle = [[UILabel alloc] initWithFrame:CGRectMake(15, coverBG.frame.origin.y+coverBG.frame.size.height+3, 150, 9)];
    detailTitle.backgroundColor = [UIColor clearColor];
    detailTitle.text = @"我的歌声里原声带第一首";
    detailTitle.font = [UIFont boldSystemFontOfSize:9];
    detailTitle.textColor = [UIColor colorWithRed:125/255.0 green:125/255.0 blue:125/255.0 alpha:1];
    [coverView addSubview:detailTitle];
    
    slider = [[UISlider alloc] initWithFrame:CGRectMake(15, height+10, 290, 24)];
    [slider setMaximumValue:1];
    [slider setMinimumValue:0];
    slider.backgroundColor = [UIColor clearColor];
    [slider setMinimumTrackImage:imageNamed(@"slider-min.png") forState:UIControlStateNormal];
    [slider setMaximumTrackImage:imageNamed(@"slider-max.png") forState:UIControlStateNormal];
    [slider setThumbImage:imageNamed(@"slider-btn.png") forState:UIControlStateNormal];
    [slider setThumbImage:imageNamed(@"slider-btn.png") forState:UIControlStateHighlighted];
    [slider addTarget:self action:@selector(sliderTouchDown:) forControlEvents:UIControlEventTouchDown];
    //滑块拖动时的事件
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    //滑动拖动后的事件
    [slider addTarget:self action:@selector(sliderDragUp:) forControlEvents:UIControlEventTouchUpInside];
    slider.enabled = NO;
    [self.view addSubview:slider];
    
    currentTime = [[UILabel alloc] initWithFrame:CGRectMake(20, height+40, 150, 15)];
    currentTime.font = [UIFont systemFontOfSize:12];
    currentTime.text = @"00:00";
    currentTime.backgroundColor = [UIColor clearColor];
    currentTime.textColor = [UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1];
    [self.view addSubview:currentTime];
    
    totalTime = [[UILabel alloc] initWithFrame:CGRectMake(160, height+40, 145, 15)];
    totalTime.font = [UIFont systemFontOfSize:12];
    totalTime.backgroundColor = [UIColor clearColor];
    totalTime.text = @"00:00";
    totalTime.textAlignment = NSTextAlignmentRight;
    totalTime.textColor = [UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1];
    [self.view addSubview:totalTime];
    
    pre = [UIButton buttonWithType:UIButtonTypeCustom];
    play = [UIButton buttonWithType:UIButtonTypeCustom];
    next = [UIButton buttonWithType:UIButtonTypeCustom];
    [pre setImage:imageNamed(@"pre.png") forState:UIControlStateNormal];
    [play setImage:imageNamed(@"play.png") forState:UIControlStateNormal];
    [play setImage:imageNamed(@"pause.png") forState:UIControlStateSelected];
    [next setImage:imageNamed(@"next.png") forState:UIControlStateNormal];
    next.enabled = [[AudioManager defaultManager] hasNext];
    pre.enabled = [[AudioManager defaultManager] hasPre];
    [pre addTarget:self action:@selector(preAudio) forControlEvents:UIControlEventTouchUpInside];
    [play addTarget:self action:@selector(playAudio) forControlEvents:UIControlEventTouchUpInside];
    [next addTarget:self action:@selector(nextAudio) forControlEvents:UIControlEventTouchUpInside];
    pre.frame = CGRectMake(0, 0, 56, 56);
    next.frame = CGRectMake(0, 0, 56, 56);
    play.frame = CGRectMake(0, 0, 76, 76);
    pre.center = CGPointMake(64, self.view.frame.size.height-100);
    play.center = CGPointMake(165, self.view.frame.size.height-100);
    next.center = CGPointMake(260, self.view.frame.size.height-100);
    [self.view addSubview:pre];
    [self.view addSubview:play];
    [self.view addSubview:next];
    
    listBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    listBtn.frame = CGRectMake(0, 0, 44, 44);
    [listBtn setImage:imageNamed(@"listItem.png") forState:UIControlStateNormal];
    [listBtn addTarget:self action:@selector(covertMode) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *listItem = [[UIBarButtonItem alloc] initWithCustomView:listBtn];
    self.navigationItem.rightBarButtonItem = listItem;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    [backBtn setImage:imageNamed(@"backItem.png") forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = back;
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.title = @"我的歌声里";
}

- (void)covertMode{
    [UIView animateWithDuration:.3 animations:^{
        if (listView.view.alpha==0) {
            [listBtn setImage:imageNamed(@"coverModeItem.png") forState:UIControlStateNormal];
            listView.view.alpha = 1;
            coverView.alpha = 0;
        } else {
            [listBtn setImage:imageNamed(@"listItem.png") forState:UIControlStateNormal];
            listView.view.alpha = 0;
            coverView.alpha = 1;
        }
    }];
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)preAudio{
    slider.enabled = NO;
    NSLog(@"pre");
    [[AudioManager defaultManager] pre];
}

- (void)playAudio{
    if ([[AudioManager defaultManager] needURL]) {
        [[AudioManager defaultManager] playListAtFirst];
        NSLog(@"init audio");
    }
    play.selected = [[AudioManager defaultManager] changeStat];
}

- (void)nextAudio{
    slider.enabled = NO;
    NSLog(@"next");
    [[AudioManager defaultManager] next];
}

- (void)checkSlider{
    if (slider.value>=1) {
        slider.enabled = NO;
        slider.value = 0;
        [self audioProgress:0];
        play.selected = NO;
    }
}

- (void)audioProgress:(float)progress{
    if (!slider.enabled) {
        slider.enabled = YES;
        int duration = [[AudioManager defaultManager] duration];
        totalTime.text = [NSString stringWithFormat:@"%02d:%02d", duration/60, duration%60];
    }
    int currentPlaybackTime = progress*[[AudioManager defaultManager] duration];
    currentTime.text = [NSString stringWithFormat:@"%02d:%02d", currentPlaybackTime/60, currentPlaybackTime%60];
    slider.value = progress;
    [self checkSlider];
}

- (void)audioPlay{
    play.selected = YES;
}

- (void)audioPause{
    play.selected = NO;
}

- (void)audioPre{
    pre.enabled = [[AudioManager defaultManager] hasPre];
    next.enabled = [[AudioManager defaultManager] hasNext];
}

- (void)audioNext{
    pre.enabled = [[AudioManager defaultManager] hasPre];
    next.enabled = [[AudioManager defaultManager] hasNext];
}

- (void)sliderValueChanged:(UISlider *)slider1{
//    NSLog(@"slider change:%f", slider.value);
    [[AudioManager defaultManager] skipTo:slider.value];
    [self audioProgress:slider.value];
    [self checkSlider];
}

- (void)sliderDragUp:(UISlider *)slider1{
    NSLog(@"slider up:%f", slider.value);
    [[AudioManager defaultManager] addListener:self];
}

- (void)sliderTouchDown:(UISlider *)slider1{
    [[AudioManager defaultManager] removeListener:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
