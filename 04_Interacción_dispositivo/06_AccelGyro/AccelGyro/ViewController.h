//
//  ViewController.h
//  AccelGyro
//
//  Created by IVAN MOLERA on 11/12/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>


@interface ViewController : UIViewController {

    double currentMaxAccelX;
    double currentMaxAccelY;
    double currentMaxAccelZ;
    double currentMaxRotX;
    double currentMaxRotY;
    double currentMaxRotZ;
}

@property (strong, nonatomic) IBOutlet UILabel *accX;
@property (strong, nonatomic) IBOutlet UILabel *accY;
@property (strong, nonatomic) IBOutlet UILabel *accZ;

@property (strong, nonatomic) IBOutlet UILabel *maxAccX;
@property (strong, nonatomic) IBOutlet UILabel *maxAccY;
@property (strong, nonatomic) IBOutlet UILabel *maxAccZ;

@property (strong, nonatomic) IBOutlet UILabel *rotX;
@property (strong, nonatomic) IBOutlet UILabel *rotY;
@property (strong, nonatomic) IBOutlet UILabel *rotZ;

@property (strong, nonatomic) IBOutlet UILabel *maxRotX;
@property (strong, nonatomic) IBOutlet UILabel *maxRotY;
@property (strong, nonatomic) IBOutlet UILabel *maxRotZ;

- (IBAction)resetMaxValues:(id)sender;

@property (strong, nonatomic) CMMotionManager *motionManager;

@end
