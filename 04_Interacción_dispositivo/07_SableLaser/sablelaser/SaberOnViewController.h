//
//  SaberOnViewController.h
//  sablelaser
//
//  Created by Raúl Flores on 25/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMotion/CoreMotion.h>

#import "SaberOnView.h"



@protocol SaberOnViewControllerDelegate;

@interface SaberOnViewController : UIViewController <UIAccelerometerDelegate, AVAudioPlayerDelegate>{
    
    AVAudioPlayer *pulse;
    AVAudioPlayer *startLaser;
    AVAudioPlayer *stopLaser;
    AVAudioPlayer *pasada1;
    AVAudioPlayer *pasada2;
    AVAudioPlayer *pasada3;
    AVAudioPlayer *pasada4;
    
    
    
    NSMutableArray *saberSoundsArray;

    CMMotionManager *acelerometro;

    //SaberOnView *saberOnView;
    
    double min;
    double max;
    double negMin;
    
    
    
    
    
}


@property (nonatomic, assign) id <SaberOnViewControllerDelegate> delegate;


@property (nonatomic, strong) SaberOnView *saberOnView;
@property (nonatomic, strong)  NSMutableArray *saberSoundsArray;


- (void) done;
- (void) createSounds;


@end

@protocol SaberOnViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(SaberOnViewController *)controller;
@end
