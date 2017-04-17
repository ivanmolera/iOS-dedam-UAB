//
//  ViewController.h
//  Escena
//
//  Created by IVAN MOLERA on 12/12/14.
//  Copyright (c) 2014 UAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) UIImage                   *airplaneImage;
@property (nonatomic, strong) UIImageView               *airplane;

@property (nonatomic, strong) UIDynamicAnimator         *animator;

@property (nonatomic, strong) UIPushBehavior            *upDown;
@property (nonatomic, strong) UIPushBehavior            *push;
@property (nonatomic, strong) UIGravityBehavior         *gravity;

@property (nonatomic, assign) int                       airplaneDirectionX;
@property (nonatomic, assign) int                       balloonDirectionY;

@property (nonatomic, strong) UISwipeGestureRecognizer  *swipeLeft;
@property (nonatomic, strong) UISwipeGestureRecognizer  *swipeRight;

@end

