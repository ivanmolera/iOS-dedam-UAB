//
//  ViewController.h
//  Ejercicio_02
//
//  Created by IVAN MOLERA on 24/11/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) UIImageView *rayoImageView;
@property (nonatomic, strong) NSTimer *paintingTimer;
@property (nonatomic, assign) BOOL imgSwitch;

- (IBAction)stopPainting:(id)sender;

@end
