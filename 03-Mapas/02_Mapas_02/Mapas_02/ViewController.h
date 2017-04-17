//
//  ViewController.h
//  Mapas_02
//
//  Created by IVAN MOLERA on 06/12/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager         *locationManager;
@property (nonatomic, strong) CLGeocoder                *geocoder;

@property (weak, nonatomic) IBOutlet MKMapView          *mapa;

@property (weak, nonatomic) IBOutlet UITextField        *textDireccion;
@property (weak, nonatomic) IBOutlet UITextField        *textLat;
@property (weak, nonatomic) IBOutlet UITextField        *textLng;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedType;

- (IBAction)goTo:(id)sender;
- (IBAction)goToAddress:(id)sender;

- (IBAction)locateDevice:(id)sender;

- (IBAction)changeMapType:(id)sender;
- (IBAction)changeMapPerspective:(id)sender;

@end
