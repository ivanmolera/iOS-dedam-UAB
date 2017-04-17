//
//  ViewController.m
//  AccelGyro
//
//  Created by IVAN MOLERA on 11/12/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    currentMaxAccelX = 0;
    currentMaxAccelY = 0;
    currentMaxAccelZ = 0;
    
    currentMaxRotX = 0;
    currentMaxRotY = 0;
    currentMaxRotZ = 0;
    
    _motionManager = [[CMMotionManager alloc] init];
    _motionManager.accelerometerUpdateInterval = .2;
    _motionManager.gyroUpdateInterval = .2;
    
    [_motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                         withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                             
        if(error == nil) {
            [self outputAccelertionData:accelerometerData.acceleration];
        }
        else {
            NSLog(@"%@", error);
        }
    }];
    
    [_motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
                                withHandler:^(CMGyroData *gyroData, NSError *error) {
                                    
        if(error == nil) {
            [self outputRotationData:gyroData.rotationRate];
        }
        else {
            NSLog(@"%@", error);
        }
    }];
}

-(void)outputAccelertionData:(CMAcceleration)acceleration {
    
    _accX.text = [NSString stringWithFormat:@" %.2fg",acceleration.x];
    if(fabs(acceleration.x) > fabs(currentMaxAccelX))
    {
        currentMaxAccelX = acceleration.x;
    }
    
    _accY.text = [NSString stringWithFormat:@" %.2fg",acceleration.y];
    if(fabs(acceleration.y) > fabs(currentMaxAccelY))
    {
        currentMaxAccelY = acceleration.y;
    }
    
    _accZ.text = [NSString stringWithFormat:@" %.2fg",acceleration.z];
    if(fabs(acceleration.z) > fabs(currentMaxAccelZ))
    {
        currentMaxAccelZ = acceleration.z;
    }
    
    _maxAccX.text = [NSString stringWithFormat:@" %.2f",currentMaxAccelX];
    _maxAccY.text = [NSString stringWithFormat:@" %.2f",currentMaxAccelY];
    _maxAccZ.text = [NSString stringWithFormat:@" %.2f",currentMaxAccelZ];
}

-(void)outputRotationData:(CMRotationRate)rotation {
    
    _rotX.text = [NSString stringWithFormat:@" %.2fr/s",rotation.x];
    if(fabs(rotation.x) > fabs(currentMaxRotX))
    {
        currentMaxRotX = rotation.x;
    }
    
    _rotY.text = [NSString stringWithFormat:@" %.2fr/s",rotation.y];
    if(fabs(rotation.y) > fabs(currentMaxRotY))
    {
        currentMaxRotY = rotation.y;
    }
    
    _rotZ.text = [NSString stringWithFormat:@" %.2fr/s",rotation.z];
    if(fabs(rotation.z) > fabs(currentMaxRotZ))
    {
        currentMaxRotZ = rotation.z;
    }
    
    _maxRotX.text = [NSString stringWithFormat:@" %.2f",currentMaxRotX];
    _maxRotY.text = [NSString stringWithFormat:@" %.2f",currentMaxRotY];
    _maxRotZ.text = [NSString stringWithFormat:@" %.2f",currentMaxRotZ];
}

- (IBAction)resetMaxValues:(id)sender {
    
    currentMaxAccelX = 0;
    currentMaxAccelY = 0;
    currentMaxAccelZ = 0;
    
    currentMaxRotX = 0;
    currentMaxRotY = 0;
    currentMaxRotZ = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
