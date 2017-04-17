//
//  ViewController.m
//  Gravity
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
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    // Creo el cuadrado
    _squareView = [[UIView alloc] initWithFrame:
                       CGRectMake(CGRectGetMidX(self.view.bounds)-50, 200.0f, 100.0f, 100.0f)];

    _squareView.backgroundColor = [UIColor greenColor];

    [self.view addSubview:_squareView];

    _squareView2 = [[UIView alloc] initWithFrame:
                   CGRectMake(CGRectGetMidX(self.view.bounds)+20, 50.0f, 100.0f, 100.0f)];
    
    _squareView2.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_squareView2];
    
    // Inicializo el animator
    _animator = [[UIDynamicAnimator alloc]
                     initWithReferenceView:self.view];
    
    // Comportamiento de gravedad
    UIDynamicBehavior *gravity = [[UIGravityBehavior alloc]
                                   initWithItems:@[_squareView, _squareView2]];
    
    [_animator addBehavior:gravity];
    
    // Comportamiento de colision
    UICollisionBehavior *collision = [[UICollisionBehavior alloc]
                                      initWithItems:@[_squareView, _squareView2]];
    
    collision.translatesReferenceBoundsIntoBoundary = YES;

    [_animator addBehavior:collision];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
