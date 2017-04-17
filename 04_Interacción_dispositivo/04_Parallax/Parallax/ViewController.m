//
//  ViewController.m
//  Parallax
//
//  Created by IVAN MOLERA on 07/12/13.
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
    
    // Cambiamos el color de fondo de nuestra vista raíz a negro
    self.view.backgroundColor = [UIColor blackColor];
    
    // Capa inferior
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 220, 220)];
    [backgroundView setBackgroundColor:[UIColor redColor]];
    [backgroundView setCenter:self.view.center];
    
    // Capa intermedia
    UIView *middleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [middleView setBackgroundColor:[UIColor blueColor]];
    [middleView setCenter:self.view.center];
    
    // Cap superior
    UIView *foregroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [foregroundView setBackgroundColor:[UIColor grayColor]];
    [foregroundView setCenter:self.view.center];
    

    [self.view addSubview:backgroundView];
    [self.view addSubview:middleView];
    [self.view addSubview:foregroundView];
    
    [self addMotionEffectToView:backgroundView speed:40.0f];
    [self addMotionEffectToView:middleView speed:-40.0f];
    [self addMotionEffectToView:foregroundView speed:-80.0f];
}

- (void)addMotionEffectToView:(UIView*)view speed:(CGFloat)speed {
    
    // Eje X
    UIInterpolatingMotionEffect* xMotion = [[UIInterpolatingMotionEffect alloc]
                                            initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    
    xMotion.minimumRelativeValue = @(-speed);
    xMotion.maximumRelativeValue = @(speed);
    
    // Eje Y
    UIInterpolatingMotionEffect* yMotion = [[UIInterpolatingMotionEffect alloc]
                                            initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    
    yMotion.minimumRelativeValue = @(-speed);
    yMotion.maximumRelativeValue = @(speed);
    
    // Agrupamos los dos comportamientos
    UIMotionEffectGroup* group = [[UIMotionEffectGroup alloc] init];
    group.motionEffects = @[xMotion, yMotion];
    
    [view addMotionEffect:group];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
