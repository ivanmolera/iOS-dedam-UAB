//
//  Persona.h
//  primeraApp
//
//  Created by IVAN MOLERA on 03/11/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Persona : NSObject

- (void) caminaAKmPorHora:(CGFloat)paramVelocidadKmPorHora;
- (void) correA10KmPorHora;
+ (CGFloat) alturaMaximaEnCentimetros;


@property (nonatomic, retain) NSString *nombre;
@property (nonatomic, retain) NSString *apellidos;
@property (nonatomic, assign) CGFloat altura;

@end
