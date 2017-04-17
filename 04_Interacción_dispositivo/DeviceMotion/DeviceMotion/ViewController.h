//
//  ViewController.h
//  DeviceMotion
//
//  Created by IVAN MOLERA on 30/12/16.
//  Copyright © 2016 UAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>


@interface ViewController : UIViewController

@property (strong, nonatomic) CMMotionManager *motionManager;


@end

