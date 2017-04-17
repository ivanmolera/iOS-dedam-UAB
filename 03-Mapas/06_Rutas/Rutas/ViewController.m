//
//  ViewController.m
//  Rutas
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
    
    CLLocation *ini = [[CLLocation alloc] initWithLatitude:41.403564
                                                 longitude:2.174431];

    CLLocation *fin = [[CLLocation alloc] initWithLatitude:41.388722
                                                 longitude:2.169239];
    
    // Lo centro sobre las dos coordenadas de la línea para que se vea el inicio y el final
    [_mapa showAnnotations:@[ini,fin] animated:YES];

    [self.view addSubview:_mapa];
    
    
    MKPlacemark *fromPlacemark = [[MKPlacemark alloc] initWithCoordinate:ini.coordinate
                                                       addressDictionary:nil];
    
    MKPlacemark *toPlacemark   = [[MKPlacemark alloc] initWithCoordinate:fin.coordinate
                                                       addressDictionary:nil];
    
    // Map Item
    MKMapItem *fromItem         = [[MKMapItem alloc] initWithPlacemark:fromPlacemark];
    MKMapItem *toItem           = [[MKMapItem alloc] initWithPlacemark:toPlacemark];
    
    [self findDirectionsFrom:fromItem to:toItem];
}

- (void) viewDidAppear:(BOOL)animated {
    
    UIAlertController *alerta =
    [UIAlertController alertControllerWithTitle:@"Alerta"
                                        message:@"Esto es un mensaje..."
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    
    [self presentViewController:alerta animated:YES completion:nil];
    

    
    [alerta dismissViewControllerAnimated:YES completion:nil];
    
    UIAlertAction *ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alerta dismissViewControllerAnimated:YES completion:nil];
                         }];
    
    [alerta addAction:ok];
    
    [alerta addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Usuario";
    }];
    
    [alerta addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Password";
        textField.secureTextEntry = YES;
    }];
}

- (void) findDirectionsFrom:(MKMapItem *)source to:(MKMapItem *)destination {

        MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
        
        [request setSource:source];
        [request setDestination:destination];
        [request setRequestsAlternateRoutes:YES];
        [request setTransportType:MKDirectionsTransportTypeAutomobile];
    
        MKDirections *directions        = [[MKDirections alloc] initWithRequest:request];
    
        [directions calculateDirectionsWithCompletionHandler: ^(MKDirectionsResponse *response, NSError *error) {
        
            if (error == nil) {
                // Cogemos la primera ruta que nos devuelve
                MKRoute *route = response.routes[0];
            
                [_mapa addOverlay:route.polyline];
            }
            else {
                NSLog(@"%@", error.debugDescription);
            }
            
            // Descomentar para mostrar la app de mapas
            //[MKMapItem openMapsWithItems:@[response.source,response.destination]
            //               launchOptions:@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving}];
        }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MapKit Delegate Methods

- (MKOverlayRenderer *) mapView:(MKMapView *)mapView
             rendererForOverlay:(id<MKOverlay>)overlay {
    
    MKPolylineRenderer *polylineRender  = [[MKPolylineRenderer alloc] initWithOverlay:overlay];

    [polylineRender setLineWidth:6.0f];
    [polylineRender setStrokeColor:[UIColor blueColor]];
    
    return polylineRender;
}

@end
