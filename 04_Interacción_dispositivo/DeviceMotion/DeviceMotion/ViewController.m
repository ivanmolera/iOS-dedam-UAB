//
//  ViewController.m
//  DeviceMotion
//
//  Created by IVAN MOLERA on 30/12/16.
//  Copyright © 2016 UAB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIImageView *balloonView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"balloon.png"]];

    [balloonView setCenter:self.view.center];
    [self.view addSubview:balloonView];
    
    
    // MOTION MANAGER
    _motionManager = [[CMMotionManager alloc] init];
    
    if (_motionManager.deviceMotionAvailable) {
        [_motionManager setDeviceMotionUpdateInterval:0.01f];
        
        [_motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue]
                                     withHandler:^(CMDeviceMotion *data, NSError *error) {
                                         
            double rotation = atan2(data.gravity.x, data.gravity.y) - M_PI;
                                         
            NSLog(@" %.2f",rotation);

            balloonView.transform = CGAffineTransformMakeRotation(rotation);
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
