//
//  ViewController.h
//  AudioPlayer
//
//  Created by IVAN MOLERA on 27/11/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController : UIViewController <AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioPlayer *audio;

@end
