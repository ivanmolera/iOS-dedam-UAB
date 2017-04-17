//
//  ViewController.m
//  CustomGestureRecognizer
//
//  Created by IVAN MOLERA on 12/12/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import "ViewController.h"
#import "RightSlideDown.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Inicializo el recognizer personalizado
    RightSlideDown *customGestureRecognizer = [[RightSlideDown alloc] initWithTarget:self action:@selector(handleRightSlide:)];
    
    [self.view addGestureRecognizer:customGestureRecognizer];
}


- (void) handleRightSlide:(RightSlideDown *)paramSender {
    NSLog(@"Right slide");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
