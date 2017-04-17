//
//  ViewController.m
//  Lineas
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
    
    CLLocation *ini = [[CLLocation alloc] initWithLatitude:41.403564 longitude:2.174431];
    CLLocation *fin = [[CLLocation alloc] initWithLatitude:40.714353 longitude:-74.005973];
    
    // Lo centro sobre las dos coordenadas de la línea para que se vea el inicio y el final
    [_mapa showAnnotations:@[ini, fin] animated:YES];
    
    [self.view addSubview:_mapa];
    
    // Coordenadas de la línea
    CLLocationCoordinate2D points[2];
    
    points[0] = ini.coordinate;
    points[1] = fin.coordinate;

    _overlayPolyline = [MKPolyline polylineWithCoordinates:points count:2];
    _geodesicPolyline= [MKGeodesicPolyline polylineWithCoordinates:points count:2];
    
    [_mapa addOverlay:_overlayPolyline];
    [_mapa addOverlay:_geodesicPolyline];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MapKit Delegate Methods

    - (MKOverlayRenderer *) mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    
        MKPolylineRenderer *polylineRender  = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
        [polylineRender setLineWidth:3.0f];

        UIColor *lineColor = [UIColor redColor];
    
        if([overlay isKindOfClass:[MKGeodesicPolyline class]]) {
            lineColor = [UIColor blackColor];
        }
        [polylineRender setStrokeColor:lineColor];
    
        return polylineRender;
    }

@end
