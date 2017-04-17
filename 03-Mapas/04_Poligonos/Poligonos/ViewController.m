//
//  ViewController.m
//  Poligonos
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
    
    // Inicializo el mapa
    _mapa = [[MKMapView alloc] initWithFrame:self.view.bounds];

    _mapa.mapType = MKMapTypeSatellite;
    _mapa.delegate = self;
    
    CLLocation *coord1 = [[CLLocation alloc] initWithLatitude:41.403620 longitude:2.175452];
    CLLocation *coord2 = [[CLLocation alloc] initWithLatitude:41.404384 longitude:2.174454];
    CLLocation *coord3 = [[CLLocation alloc] initWithLatitude:41.403539 longitude:2.173349];
    CLLocation *coord4 = [[CLLocation alloc] initWithLatitude:41.402751 longitude:2.174326];

    // Centro el mapa sobre las coordenadas
    [_mapa showAnnotations:@[coord1,coord2,coord3,coord4] animated:YES];
    
    [self.view addSubview:_mapa];
    
    // Coordenadas del polígono
    CLLocationCoordinate2D points[4];
    
    points[0] = coord1.coordinate;
    points[1] = coord2.coordinate;
    points[2] = coord3.coordinate;
    points[3] = coord4.coordinate;

    _regionPolygon = [MKPolygon polygonWithCoordinates:points count:4];
    
    [_mapa addOverlay:_regionPolygon];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MapKit Delegate Methods

- (MKOverlayRenderer *) mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    
    UIColor *blueColorTranslucent = [UIColor colorWithRed:0 green:0 blue:255.0f alpha:0.5f];
    MKPolygonRenderer *polygonRenderer  = [[MKPolygonRenderer alloc] initWithOverlay:overlay];
    polygonRenderer.strokeColor         = [UIColor blueColor];
    polygonRenderer.fillColor           = blueColorTranslucent;
    polygonRenderer.lineWidth           = 2.0f;
        
    return polygonRenderer;
}

@end
