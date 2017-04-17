//
//  ViewController.m
//  sablelaser
//
//  Created by Raúl Flores on 22/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize saberSoundsArray=_saberSoundsArray;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload]; 
    self.saberSoundsArray = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)startLaser:(id)sender {
    
    //vibración
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    SaberOnViewController *controller = [[SaberOnViewController alloc] init];
    
    [controller setDelegate:self];
    
    
    [controller setSaberSoundsArray: _saberSoundsArray];
    
    
    [self presentModalViewController:controller animated:YES];
    

    
    //NSLog(@"view: %@",[[self view] description]);


    //NSLog(@"saberSoundsArray: %@",[_saberSoundsArray description]);
}

- (void)flipsideViewControllerDidFinish:(SaberOnViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
