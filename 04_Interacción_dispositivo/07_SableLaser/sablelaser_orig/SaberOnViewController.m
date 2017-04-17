//
//  SaberOnViewController.m
//  sablelaser
//
//  Created by Raúl Flores on 25/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SaberOnViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation SaberOnViewController

@synthesize delegate=_delegate;
@synthesize saberOnView;
@synthesize saberSoundsArray = _saberSoundsArray;

double const kminimum = 0.8;
double const knegativeMinimum = -0.8;
double const kmaximum = 1.3;
double const knegativeMaximum = -1.3;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidUnload
{
    [super viewDidUnload];
    self.saberOnView=nil;
    acelerometro=nil;
    self.saberSoundsArray=nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    
}

- (void)loadView {
    
    UIApplication *thisApp = [UIApplication sharedApplication];
    thisApp.idleTimerDisabled = YES;
    
	saberOnView = [[SaberOnView alloc] initWithFrame:CGRectZero];
	[saberOnView canBecomeFirstResponder];
	[saberOnView becomeFirstResponder];
    

    
    [self createSounds];
    
    acelerometro = [UIAccelerometer sharedAccelerometer];
    
    [acelerometro setUpdateInterval:0.0416]; 
    
    [acelerometro setDelegate:self];
    
    //variables del acelerometro
    min=kminimum;
    max=kmaximum;
    negMin=knegativeMinimum;
    
    
	NSLog(@"monitoring accelerometer");
    
    
	
	self.view = saberOnView;
	
    
    
    [startLaser play];
    
    [pulse play];

    
    
	
}

- (void)touchesBegan:(NSSet *)touches 
           withEvent:(UIEvent *)event 
{ 
    NSLog(@"stopLaser!!");
    [self done];
    
    
} 




- (void)done
{
    [acelerometro setDelegate:nil];
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    [pulse stop];
    
    [stopLaser play];
    
    
    UIApplication *thisApp = [UIApplication sharedApplication];
    thisApp.idleTimerDisabled = NO;
    
    NSLog(@"not monitoring accelerometer");
    
    [self.delegate flipsideViewControllerDidFinish:self];
    
    
}



- (void)accelerometer:(UIAccelerometer *)meter didAccelerate:(UIAcceleration *)accel
{
    
    saberOnView.xShift = saberOnView.xShift * 0.8 + [accel x] * 20.0;
    NSLog(@"monitoring accelerometer2");
    
    
    // Redraw the view
    [self.view setNeedsDisplay];
    
    
    
    
    
    if (  accel.x > min && accel.x < kmaximum)
        
    {
        
        [pasada1 play];
        min=accel.x;
        negMin=knegativeMinimum;
        
    }
    
    if (  accel.x < negMin && accel.x > knegativeMaximum)
        
    {
        
        [pasada2 play];
        negMin=accel.x;
        min=kminimum;
    }
    
    if (  accel.y > min && accel.y < kmaximum)
        
    {
        
        [pasada3 play];
        min=accel.y;
        negMin=knegativeMinimum;
        max=kmaximum;
    }
    
    if (  accel.y < negMin && accel.y > knegativeMaximum)
        
    {
        
        [pasada4 play];
        negMin=accel.y;
        min=kminimum;
    }
    
    if (  accel.y > max)
        
    {
        int randomHit = 7 + arc4random() % 7;
        //NSLog(@"randomHit:%i",randomHit);
        
        
        [(AVAudioPlayer *)[self.saberSoundsArray objectAtIndex:randomHit]    play] ;
        max=accel.y;
        
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        
    }
    
    
    
    //NSLog(@"accel.x:%f",accel.x);
    //NSLog(@"accel.y:%f",accel.y);
    //NSLog(@"accel.z:%f",accel.z);
    
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    
}


-(void) createSounds
{
    
    //sonido constante*************************
    pulse = (AVAudioPlayer *)[self.saberSoundsArray objectAtIndex:0];
    
    pulse.numberOfLoops=-1;
    pulse.delegate=self;
    
    
    
    //sonido entrada*************************
    
    startLaser=(AVAudioPlayer *)[self.saberSoundsArray objectAtIndex:1];
    
    
    
    //sonido salida*************************
    stopLaser = (AVAudioPlayer *)[self.saberSoundsArray objectAtIndex:2];
    
    
    
    
    //sonido pasada1*************************
    
    pasada1 = (AVAudioPlayer *)[self.saberSoundsArray objectAtIndex:3];
    
    
    //sonido pasada2*************************
    pasada2 = (AVAudioPlayer *)[self.saberSoundsArray objectAtIndex:4];
    
    
    //sonido pasada3*************************
    
    pasada3 = (AVAudioPlayer *)[self.saberSoundsArray objectAtIndex:5];
    
    
    //sonido pasada4*************************
    
    
    pasada4 = (AVAudioPlayer *)[self.saberSoundsArray objectAtIndex:6];
    
    
    
    
    
    
}    


-(void)audioPlayerBeginInterruption:(AVAudioPlayer *)player
{
    //NSLog(@"audioPlayerBeginInterruption");
    [pulse stop];
    
}
-(void)audioPlayerEndInterruption:(AVAudioPlayer *)player
{
    //NSLog(@"audioPlayerEndInterruption");
    [pulse play];
}


@end
