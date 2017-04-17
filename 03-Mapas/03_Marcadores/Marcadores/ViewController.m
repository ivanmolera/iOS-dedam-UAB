//
//  ViewController.m
//  Marcadores
//
//  Created by IVAN MOLERA on 08/12/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import "ViewController.h"
#import "AnotacionCustomizada.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _mapa = [[MKMapView alloc] initWithFrame:self.view.bounds];

    _mapa.mapType = MKMapTypeSatellite;
    _mapa.delegate = self;
    
    CLLocation *coord = [[CLLocation alloc] initWithLatitude:41.403564 longitude:2.174431];
    
    // Centro el mapa sobre las coordenadas
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord.coordinate, 300, 300);
    [_mapa setRegion:region animated:YES];
    
    [self.view addSubview:_mapa];
    
    AnotacionCustomizada *anotacion = [[AnotacionCustomizada alloc] initWithCoordinates:coord.coordinate
                                                                          title:@"Título"
                                                                       subtitle:@"Subtítulo"];
    
    [_mapa addAnnotation:anotacion];

    
    // Añado otra AnotacionCustomizada al mapa
    CLLocation *coord2 = [[CLLocation alloc] initWithLatitude:41.404064 longitude:2.175431];
    
    AnotacionCustomizada *anotacion2 = [[AnotacionCustomizada alloc] initWithCoordinates:coord2.coordinate
                                                                          title:@"Otro Título"
                                                                       subtitle:@"Otro Subtítulo"];
    
    [_mapa addAnnotation:anotacion2];
}

// Sobreescribimos el método para poder modificar elementos de la anotación como la imagen.
- (MKAnnotationView *) mapView: (MKMapView *) mapView viewForAnnotation: (id) annotation {
    
    // Sólo las anotaciones costumizadas
    if([annotation isKindOfClass:[AnotacionCustomizada class]] == NO) {
        return nil;
    }
    
    AnotacionCustomizada *anotacion = (AnotacionCustomizada*)annotation;
    
    return [anotacion annotationView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
