//
//  ViewController.m
//  Escena
//
//  Created by IVAN MOLERA on 12/12/14.
//  Copyright (c) 2014 UAB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    
    // GLOBOS IMAGEVIEWS
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.jpg"]];
    
    UIImageView *balloons = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ground.png"]];
    [balloons setTransform:CGAffineTransformMakeScale(0.7, 0.7)];
    [balloons setCenter:CGPointMake(self.view.center.x - 120, self.view.center.y + 80)];
    
    UIImageView *balloon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"balloon.png"]];
    [balloon setCenter:CGPointMake(self.view.center.x, CGRectGetMidY(balloon.frame))];
    
    [self.view addSubview:background];
    [self.view addSubview:balloons];
    [self.view addSubview:balloon];
    
    
    // AVION IMAGEVIEW
    _airplaneImage = [UIImage imageNamed:@"airplane.png"];
    _airplane = [[UIImageView alloc] initWithImage:_airplaneImage];
    [_airplane setFrame:CGRectMake(0, self.view.frame.size.height - 150, CGRectGetMidX(_airplane.frame), CGRectGetMidY(_airplane.frame))];

    [self.view addSubview:_airplane];
    
    // PARALLAX
    [self addMotionEffectToView:background speed:40];
    [self addMotionEffectToView:balloons speed:-40];
    [self addMotionEffectToView:balloon speed:-100];
    [self addMotionEffectToView:_airplane speed:140];
    
    
    // ANIMATOR
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // COLLISION
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[_airplane]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:collision];
    
    // GRAVEDAD
    _gravity = [[UIGravityBehavior alloc] init];
    [_animator addBehavior:_gravity];
    
    // MOVIMIENTO AVION
    _push = [[UIPushBehavior alloc] initWithItems:@[_airplane] mode:UIPushBehaviorModeContinuous];
    
    // MOVIMIENTO GLOBO
    _upDown = [[UIPushBehavior alloc] initWithItems:@[balloon] mode:UIPushBehaviorModeContinuous];
    
    _airplaneDirectionX = -5;
    _balloonDirectionY = 1;
    [self switchUpDown];
    
    [NSTimer scheduledTimerWithTimeInterval:10
                                     target:self
                                   selector:@selector(switchUpDown)
                                   userInfo:nil
                                    repeats:YES];
    
    [self initGestureRecognizers];
}

- (void) switchUpDown {
    _balloonDirectionY *= -1;
    [_animator removeBehavior:_upDown];
    [_upDown setMagnitude:1];
    [_upDown setPushDirection:CGVectorMake(0, _balloonDirectionY)];
    [_animator addBehavior:_upDown];
}

-(void) addMotionEffectToView:(UIImageView *)view speed:(float)speed {
    
    UIInterpolatingMotionEffect *xMotion = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    
    [xMotion setMinimumRelativeValue:@(-speed)];
    [xMotion setMaximumRelativeValue:@(speed)];
    
    UIInterpolatingMotionEffect *yMotion = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    
    [yMotion setMinimumRelativeValue:@(-speed)];
    [yMotion setMaximumRelativeValue:@(speed)];
    
    
    UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc] init];
    [group setMotionEffects:@[xMotion, yMotion]];
    
    [view addMotionEffect:group];
}

- (void) initGestureRecognizers {
    _swipeLeft     = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    _swipeRight    = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];

    [_swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [_swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];

    [self.view addGestureRecognizer:_swipeRight];
    [self.view addGestureRecognizer:tap];
}

- (void) handleTap:(UITapGestureRecognizer *)paramSender {

    CGPoint point = [paramSender locationOfTouch:0 inView:paramSender.view];

    UIImageView *parachute = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"parachute.png"]];
    [parachute setFrame:CGRectMake(point.x, point.y, 150, 148)];
    [self.view addSubview:parachute];

    [_gravity addItem:parachute];
}

- (void) handleSwipe:(UISwipeGestureRecognizer *)paramSender {
    
    _airplaneDirectionX *= -1;
    
    [_animator removeBehavior:_push];

    if(paramSender.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        // GIRO LA IMAGEN
        _airplaneImage = [UIImage imageWithCGImage:_airplaneImage.CGImage scale:_airplaneImage.scale orientation:UIImageOrientationUpMirrored];
        [_airplane setImage:_airplaneImage];

        // DIRECCION IMPULSO
        [_push setPushDirection:CGVectorMake(_airplaneDirectionX, 0)];

        [self.view removeGestureRecognizer:_swipeLeft];
        [self.view addGestureRecognizer:_swipeRight];
    }
    else if(paramSender.direction == UISwipeGestureRecognizerDirectionRight) {
        
        //  IMAGEN ORIGINAL
        _airplaneImage = [UIImage imageNamed:@"airplane.png"];
        [_airplane setImage:_airplaneImage];
        
        // DIRECCION IMPULSO
        [_push setPushDirection:CGVectorMake(_airplaneDirectionX, 0)];
        
        [self.view addGestureRecognizer:_swipeLeft];
        [self.view removeGestureRecognizer:_swipeRight];
    }
    
    [_animator addBehavior:_push];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
