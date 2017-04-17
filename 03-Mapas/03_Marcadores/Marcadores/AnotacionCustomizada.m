//
//  CustomAnnotation.m
//  Marcadores
//
//  Created by IVAN MOLERA on 08/12/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import "AnotacionCustomizada.h"

@implementation AnotacionCustomizada

    - (instancetype) initWithCoordinates:(CLLocationCoordinate2D)paramCoordinates
                                   title:(NSString*)paramTitle
                                subtitle:(NSString*)paramSubtitle {
        self = [super init];
    
        if(self != nil) {
            _coordinate = paramCoordinates;
            _title = paramTitle;
            _subtitle = paramSubtitle;
        }
    
        return self;
    }

    - (MKAnnotationView *) annotationView {
        MKAnnotationView *aView = [[MKAnnotationView alloc] initWithAnnotation:self
                                                               reuseIdentifier:@"pinView"];
    
        // Configuramos la vista
        [aView setCenterOffset:CGPointMake(0, -20)];
        [aView setEnabled:YES];
        [aView setDraggable:YES];
        [aView setCanShowCallout:YES];
    
        UIImage *imagen = [UIImage imageNamed:@"pin.png"];
    
        aView.image = imagen;
    
        // Le damos el tamaño al pin
        CGRect frame = aView.frame;
        frame.size.width = 74;
        frame.size.height = 88;
    
        aView.frame = frame;

        return aView;
    }

@end
