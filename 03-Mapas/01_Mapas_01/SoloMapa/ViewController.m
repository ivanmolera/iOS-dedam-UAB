//
//  ViewController.m
//  SoloMapa
//
//  Created by IVAN MOLERA on 02/12/13.
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
    
    _miMapView = [[MKMapView alloc] initWithFrame:self.view.bounds];

    _miMapView.mapType = MKMapTypeStandard;
    
    CLLocationCoordinate2D centerCood = CLLocationCoordinate2DMake(41.403564, 2.174431);
    CLLocationCoordinate2D eyeCoord = CLLocationCoordinate2DMake(41.404564, 2.174431);
    
    MKMapCamera *camera = [MKMapCamera cameraLookingAtCenterCoordinate:centerCood
                                                     fromEyeCoordinate:eyeCoord
                                                           eyeAltitude:100];
    
    
    _miMapView.delegate = self;

    _miMapView.showsBuildings = YES;
    _miMapView.showsPointsOfInterest = YES;

    _miMapView.pitchEnabled = YES;
    _miMapView.zoomEnabled = YES;
    _miMapView.scrollEnabled = YES;
    
    /*
    MKMapCamera *currentCamera = _miMapView.camera;
    currentCamera.pitch     = 70.0f;
    currentCamera.altitude  = 100.0f;
    */
    
    [_miMapView setCamera:camera animated:NO];
    
    [self.view addSubview:_miMapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
