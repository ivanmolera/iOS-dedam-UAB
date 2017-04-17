//
//  ViewController.m
//  SensorProximidad
//
//  Created by IVAN MOLERA on 08/12/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(proximityStateDidChange)
                                                 name:UIDeviceProximityStateDidChangeNotification
                                               object:nil];
}

- (void)proximityStateDidChange {
    UIDevice *myDevice = [UIDevice currentDevice];
    
    if (myDevice.proximityState) {
        
        // Código para cuando el sensor este activado
        [self.view setBackgroundColor:[UIColor blueColor]];
        
    } else {
        
        // Código para cuando el sensor este desactivado
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
