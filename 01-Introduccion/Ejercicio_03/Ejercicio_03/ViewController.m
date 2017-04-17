//
//  ViewController.m
//  Ejercicio_03
//
//  Created by IVAN MOLERA on 24/11/13.
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
    
    UIImage *rayo1 = [UIImage imageNamed:@"rayo1.jpg"];
    UIImage *rayo2 = [UIImage imageNamed:@"rayo2.jpg"];
    
    _rayoImageView = [[UIImageView alloc] initWithImage:rayo1];
    
    [_rayoImageView setFrame:CGRectMake(self.view.bounds.size.width/4,
                                        30.0f,
                                        150.0f,
                                        100.0f)];

    [self.view addSubview:_rayoImageView];
    
    [_rayoImageView setAnimationImages:[NSArray arrayWithObjects: rayo1, rayo2, nil]];
    
	[_rayoImageView setAnimationRepeatCount:0];
    [_rayoImageView setAnimationDuration:0.4];
    
    [_rayoImageView startAnimating];
}

- (IBAction)stopAnimation:(id)sender {
    [_rayoImageView stopAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
