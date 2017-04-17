//
//  ViewController.m
//  Mapas_02
//
//  Created by IVAN MOLERA on 06/12/13.
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
    
    _locationManager = [[CLLocationManager alloc] init];
    
    [_locationManager setDelegate:self];
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    _geocoder        = [[CLGeocoder alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setAnnotationWithCoords:(CLLocationCoordinate2D)coords {

    // Abans de posar un nou pin, esborro els anteriors
    for (id annotation in _mapa.annotations) {
        [_mapa removeAnnotation:annotation];
    }
    
    //[_mapa removeAnnotations:_mapa.annotations];
    
    // Inicialitzo
    MKPointAnnotation *anotation = [[MKPointAnnotation alloc] init];

    // Setejo coordenades
    [anotation setCoordinate:coords];
    
    // Customitzo l'etiqueta del pin
    [anotation setTitle:_textDireccion.text];
    [anotation setSubtitle:[NSString stringWithFormat:@"(%f, %f)", coords.latitude, coords.longitude]];
    
    // Posem el pin en el mapa
    [_mapa addAnnotation:anotation];
}

- (void) setRegionWithCoords:(CLLocationCoordinate2D)coords {
    // Regió en metres
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coords, 300, 300);

    // Setejo la regió al mapa
    [_mapa setRegion:region animated:YES];
    // Ajustem l'aspect ratio per assegurar que el mapa queda dins de la vista
    [_mapa regionThatFits:region];
}

- (IBAction)goTo:(id)sender {
    // Agafo les coordenades (Lat, Lng) fent cast dels valors dels TextFields
    CGFloat lat = (CGFloat)[_textLat.text floatValue];
    CGFloat lng = (CGFloat)[_textLng.text floatValue];
    
    // Inicialitzo un objecte location amb les coordenades (el necessitaré per trobar l'adreça)
    CLLocation *location = [[CLLocation alloc] initWithLatitude:lat longitude:lng];
    
    // Busquem l'adreça a partir de les coordenades lat, lng
    [_geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        
        // En cas que no hi hagi hagut cap error i s'hagi trobat algun resultat
        if (error == nil && [placemarks count] > 0) {
            CLPlacemark *placemark = [placemarks lastObject];

            NSString *numero = (placemark.subThoroughfare != nil) ? placemark.subThoroughfare : @"";
            NSString *calle  = (placemark.thoroughfare != nil) ? placemark.thoroughfare : @"";
            NSString *codigo = (placemark.postalCode != nil) ? placemark.postalCode : @"";
            NSString *ciudad = (placemark.locality != nil) ? placemark.locality : @"";
            NSString *prov   = (placemark.administrativeArea != nil) ? placemark.administrativeArea : @"";
            NSString *pais   = (placemark.country != nil) ? placemark.country : @"";
            
            // Actualitzo el TextField de l'adreça
            _textDireccion.text = [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@",
                                   numero,
                                   calle,
                                   codigo,
                                   ciudad,
                                   prov,
                                   pais];

            // Selecciono la opció vista 2D
            [_segmentedType setSelectedSegmentIndex:0];

            // Centro la regió i poso un pin
            [self setRegionWithCoords:location.coordinate];
            [self setAnnotationWithCoords:location.coordinate];
        }
        else if(error == nil && [placemarks count] == 0) {
            NSLog(@"No se ha podido encontrar la dirección para estas coordenadas");
        }
        else if(error != nil) {
            NSLog(@"%@", error.debugDescription);
            _textDireccion.text = @"???";
        }
    } ];
}




- (IBAction)goToAddress:(id)sender {
    NSString *address = _textDireccion.text;
    
    [_geocoder geocodeAddressString:address
                completionHandler:^(NSArray *placemarks, NSError *error) {
                    
        if (error == nil && [placemarks count] > 0) {
            CLPlacemark *placemark = [placemarks lastObject];
            
            CGFloat lat = placemark.location.coordinate.latitude;
            CGFloat lng = placemark.location.coordinate.longitude;
                           
            _textLat.text = [NSString stringWithFormat:@"%f", lat];
            _textLng.text = [NSString stringWithFormat:@"%f", lng];

            // Selecciono la opció vista 2D
            [_segmentedType setSelectedSegmentIndex:0];

            // Centro la regió i poso un pin
            [self setRegionWithCoords:placemark.location.coordinate];
            [self setAnnotationWithCoords:placemark.location.coordinate];
        }
        else if(error == nil && [placemarks count] == 0) {
            NSLog(@"No se han podido encontrar las coordenadas para esta dirección");
        }
        else if(error != nil) {
            NSLog(@"%@", error.debugDescription);
        }
    }];
}

- (IBAction)locateDevice:(id)sender {
    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
    }

    [_locationManager startUpdatingLocation];
    [_locationManager stopUpdatingLocation];
}

- (IBAction)changeMapType:(id)sender {
    NSInteger optionSelected    = [((UISegmentedControl *)sender) selectedSegmentIndex];
    
    switch (optionSelected) {
        case 0:
            [_mapa setMapType:MKMapTypeStandard];
            [_segmentedType setEnabled:YES];
            break;
        case 1:
            [_mapa setMapType:MKMapTypeSatellite];
            [_segmentedType setSelectedSegmentIndex:0];
            [_segmentedType setEnabled:NO];
            break;
        case 2:
            [_mapa setMapType:MKMapTypeHybrid];
            [_segmentedType setSelectedSegmentIndex:0];
            [_segmentedType setEnabled:NO];
            break;
        case 3:
            [_mapa setMapType:MKMapTypeSatelliteFlyover];
            //[_mapa setVisibleMapRect:MKMapRectMake(41.403564, 2.174431, 300, 500) animated:YES];
            [_segmentedType setEnabled:YES];
            break;
        default:
            [_mapa setMapType:MKMapTypeStandard];
            [_segmentedType setEnabled:YES];
            break;
    }
}

- (IBAction)changeMapPerspective:(id)sender {
    NSInteger optionSelected    = [((UISegmentedControl *)sender) selectedSegmentIndex];
    
    MKMapCamera* currentCamera  = _mapa.camera;
    
    switch (optionSelected) {
        case 0:
            currentCamera.pitch     = 0.0f;
            break;
        case 1:
            currentCamera.pitch     = 70.0f;
            currentCamera.altitude  = 100.0f;
            break;
        default:
            currentCamera.pitch     = 0.0f;
            break;
    }
    _mapa.showsBuildings = YES;
    [_mapa showsBuildings];

    [_mapa setCamera:currentCamera
            animated:YES];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    CLLocation *currentLocation = [locations lastObject];
    
    if (currentLocation != nil) {
        // Setejo els valors que em retorna el GPS en els textfields de Lat i Lng
        _textLng.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        _textLat.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
    
    // Aturo l'actualització de localització, només vull la posició quan apreten el botó
    [_locationManager stopUpdatingLocation];
    
    [self setRegionWithCoords:currentLocation.coordinate];
    [self setAnnotationWithCoords:currentLocation.coordinate];
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    UIAlertController *alerta = [UIAlertController alertControllerWithTitle:@"Error"
                                                  message:@"No s'ha pogut localitzar el dispositiu"
                                           preferredStyle:UIAlertControllerStyleActionSheet];
    
    NSLog(@"aaa");
    [self presentViewController:alerta animated:YES completion:nil];
    
    NSLog(@"No s'ha pogut localitzar el dispositiu");
    NSLog(@"didFailWithError: %@", error);
}

@end
