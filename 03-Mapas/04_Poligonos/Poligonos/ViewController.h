//
//  ViewController.h
//  Poligonos
//
//  Created by IVAN MOLERA on 08/12/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property(nonatomic, strong) MKMapView          *mapa;
@property(nonatomic, strong) MKPolygon          *regionPolygon;

@end
