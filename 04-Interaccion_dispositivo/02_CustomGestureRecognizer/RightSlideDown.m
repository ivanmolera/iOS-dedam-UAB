//
//  RightSlideDown.m
//  GestureRecognizers
//
//  Created by IVAN MOLERA on 12/12/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import "RightSlideDown.h"

@implementation RightSlideDown

-(id)initWithTarget:(id)target action:(SEL)action {
    if ((self = [super initWithTarget:target action:action])) {
        // TODO: implementar setup si fuera necesario
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    if ([touch locationInView:self.view].x < CGRectGetMidX(self.view.bounds)) {
        self.state = UIGestureRecognizerStateFailed;
    }
    else if ([touch locationInView:self.view].y > CGRectGetMidY(self.view.bounds)) {
        self.state = UIGestureRecognizerStateFailed;
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    if([touch locationInView:self.view].x < CGRectGetMidX(self.view.bounds)) {
        self.state = UIGestureRecognizerStateFailed;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    if ([touch locationInView:self.view].x < CGRectGetMidX(self.view.bounds)) {
        self.state = UIGestureRecognizerStateFailed;
    }
    else if ([touch locationInView:self.view].y < CGRectGetMidY(self.view.bounds)) {
        self.state = UIGestureRecognizerStateFailed;
    }
    else {
        // Al setear el estado a “recognized” se dispara la action del recognizer
        self.state = UIGestureRecognizerStateRecognized;
    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    self.state = UIGestureRecognizerStateCancelled;
}

@end
