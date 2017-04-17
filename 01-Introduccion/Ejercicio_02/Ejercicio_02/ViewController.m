//
//  ViewController.m
//  Ejercicio_02
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
    
    UIImage *rayo = [UIImage imageNamed:@"rayo1.jpg"];
    
    _rayoImageView = [[UIImageView alloc] initWithImage:rayo];
    [_rayoImageView setFrame:CGRectMake(self.view.bounds.size.width/4,
                                        30.0f,
                                        150.0f,
                                        100.0f)];
    
    [self.view addSubview:_rayoImageView];
    
    [self startPainting];
    
}

- (void) startPainting {
    _paintingTimer = [NSTimer scheduledTimerWithTimeInterval:0.2f
                                                      target:self
                                                    selector:@selector(paint)
                                                    userInfo:nil
                                                     repeats:YES];
    _imgSwitch = YES;
}

- (IBAction)stopPainting:(id)sender {
    if(_paintingTimer != nil) {
        [_paintingTimer invalidate];
    }
}

- (void) paint {
    UIImage *rayo = nil;
    
    if(_imgSwitch) {
        _imgSwitch = NO;
        rayo = [UIImage imageNamed:@"rayo2.jpg"];
    }
    else {
        _imgSwitch = YES;
        rayo = [UIImage imageNamed:@"rayo1.jpg"];
    }
    
    [_rayoImageView setImage:rayo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
