//
//  Persona.m
//  primeraApp
//
//  Created by IVAN MOLERA on 03/11/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import "Persona.h"

@implementation Persona

- (void) caminaAKmPorHora:(CGFloat)paramVelocidadKmPorHora {
    /* Código del método */
}

- (void) correA10KmPorHora {
    /* Llamamos al método desde nuestra propia clase y le pasamos el valor 10 */
    [self caminaAKmPorHora:10.0f];
}

+ (CGFloat) alturaMaximaEnCentimetros {
    return 250.0f;
}

- (void) cantarUnaCancion:(NSString *)paramTitulo volumen:(CGFloat)paramVolumen {
}

@end
