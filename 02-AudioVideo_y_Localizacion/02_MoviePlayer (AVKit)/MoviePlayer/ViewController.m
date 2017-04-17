//
//  ViewController.m
//  MoviePlayer
//
//  Created by IVAN MOLERA on 15/11/15.
//  Copyright © 2015 UAB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"video001" ofType:@"mp4"];
    NSURL *movieURL = [NSURL fileURLWithPath:path];
    
    AVAsset *asset = [AVAsset assetWithURL:movieURL];
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithAsset:asset];

    AVPlayer *player = [[AVPlayer alloc] initWithPlayerItem:item];

    [player setActionAtItemEnd:AVPlayerActionAtItemEndNone];
    [player setVolume:1.0f];
    
    _moviePlayerVC = [AVPlayerViewController new];
    
    [_moviePlayerVC setPlayer:player];
    [_moviePlayerVC setShowsPlaybackControls:YES];
}

- (void) viewDidAppear:(BOOL)animated {
    [self presentViewController:_moviePlayerVC animated:YES completion:nil];

    [_moviePlayerVC.player seekToTime:kCMTimeZero];
    [_moviePlayerVC.player play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
