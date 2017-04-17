//
//  ViewController.m
//  GestureRecognizers
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
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // Inicializo el recognizer Swipe
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc]
                                                        initWithTarget:self
                                                                action:@selector(handleSwipes:)];
    
    // Swipes de derecha a izquierda
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    
    // Con un solo dedo
    swipeGestureRecognizer.numberOfTouchesRequired = 1;
    
    [self.view addGestureRecognizer:swipeGestureRecognizer];
    
    
    // Inicializo el recognizer Rotation
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotations:)];
    
    [self.view addGestureRecognizer:rotationGestureRecognizer];
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"goku.jpg"]];
    _imageView.center = self.view.center;
    [_imageView setFrame:CGRectMake(280.0f, 300.0f, 240.0f, 400.0f)];
    
    [self.view addSubview:_imageView];
    
    
    // Inicializo el recognizer Pinch
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinches:)];
    
    [self.view addGestureRecognizer:pinchGestureRecognizer];
    
    
    // Inicializo el recognizer Tap
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTaps:)];
    
    // Double-Tap con un dedo
    tapGestureRecognizer.numberOfTouchesRequired = 1;
    tapGestureRecognizer.numberOfTapsRequired = 2;
    
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    
    // Inicializo el recognizer Long-Press
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    
    longPressGestureRecognizer.numberOfTouchesRequired = 1;
    longPressGestureRecognizer.minimumPressDuration = 1.0;
    longPressGestureRecognizer.allowableMovement = 100.0f;
    
    [self.view addGestureRecognizer:longPressGestureRecognizer];
    
    
    
    // Inicializo el recognizer Pan
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    
    panGestureRecognizer.minimumNumberOfTouches = 1;
    panGestureRecognizer.maximumNumberOfTouches = 1;
    
    [self.view addGestureRecognizer:panGestureRecognizer];
}

- (void) handleSwipes:(UISwipeGestureRecognizer *)paramSender {
    
    if (paramSender.direction & UISwipeGestureRecognizerDirectionDown){
        NSLog(@"Swiped Down.");
    }
    if (paramSender.direction & UISwipeGestureRecognizerDirectionLeft){
        NSLog(@"Swiped Left.");
    }
    if (paramSender.direction & UISwipeGestureRecognizerDirectionRight){
        NSLog(@"Swiped Right.");
    }
    if (paramSender.direction & UISwipeGestureRecognizerDirectionUp){
        NSLog(@"Swiped Up.");
    }
}

- (void) handleRotations:(UIRotationGestureRecognizer *)paramSender {
    
    if (_imageView == nil){
        return;
    }

    // Sumamos el ángulo anterior y el de la rotación
    _imageView.transform =
    CGAffineTransformMakeRotation(_rotationAngleInRadians +
                                  paramSender.rotation);
    
    // Guardamos el ángulo una vez finalizada la rotación
    if (paramSender.state == UIGestureRecognizerStateEnded){
        _rotationAngleInRadians += paramSender.rotation;
    }
}

- (void) handlePinches:(UIPinchGestureRecognizer*)paramSender {
    
    if (paramSender.state == UIGestureRecognizerStateEnded) {
        _currentScale = paramSender.scale;
    }
    else if (paramSender.state == UIGestureRecognizerStateBegan &&
               _currentScale != 0.0f) {
        paramSender.scale = _currentScale;
    }
    
    if (paramSender.scale != NAN && paramSender.scale != 0.0){
        _imageView.transform = CGAffineTransformMakeScale(paramSender.scale,
                                   paramSender.scale);
    }
}

- (void) handleTaps:(UITapGestureRecognizer*)paramSender {
    
    NSUInteger touchCounter = 0;

    for (touchCounter = 0; touchCounter < paramSender.numberOfTouchesRequired; touchCounter++) {
        
        CGPoint touchPoint = [paramSender locationOfTouch:touchCounter inView:paramSender.view];
        
        NSLog(@"Touch #%lu: %@", (unsigned long)touchCounter+1, NSStringFromCGPoint(touchPoint));
    }
}

- (void) handleLongPress:(UILongPressGestureRecognizer *)paramSender {
    [_imageView setCenter:[paramSender locationOfTouch:0 inView:paramSender.view]];
}

- (void) handlePan:(UIPanGestureRecognizer*)paramSender {
    
    if (paramSender.state != UIGestureRecognizerStateEnded &&
        paramSender.state != UIGestureRecognizerStateFailed) {
        
        CGPoint location = [paramSender locationInView:paramSender.view];
        
        _imageView.center = location;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
