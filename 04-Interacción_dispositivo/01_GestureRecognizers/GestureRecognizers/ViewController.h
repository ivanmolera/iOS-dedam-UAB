//
//  ViewController.h
//  GestureRecognizers
//
//  Created by IVAN MOLERA on 08/12/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,unsafe_unretained) CGFloat rotationAngleInRadians;
@property(nonatomic,unsafe_unretained) CGFloat currentScale;

@end
