//
//  ViewController.m
//  Ejercicio_04
//
//  Created by IVAN MOLERA on 24/11/13.
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

    // Busco la imagen
    UIImage *fondo = [UIImage imageNamed:@"fondo.jpg"];
    
    // Inicializo la vista con la imagen
    _fondoImageView = [[UIImageView alloc] initWithImage:fondo];
    
    // Le doy un tamaño
    [_fondoImageView setFrame:self.view.bounds];
    
    // La inserto en la vista principal
    [self.view addSubview:_fondoImageView];
    
    
    
    
    // Busco la imagen del paracaidista
    UIImage *parachute = [UIImage imageNamed:@"parachute.png"];
    
    // Inicializo la vista con la imagen
    _parachuteImageView = [[UIImageView alloc] initWithImage:parachute];
    
    // Inserto en la vista principal
    [self.view addSubview:_parachuteImageView];
    
    
    

    
    // Busco la imagen del avión
    UIImage *airplane = [UIImage imageNamed:@"airplane.png"];
    
    // Inicializo la vista con la imagen
    _airplaneImageView = [[UIImageView alloc] initWithImage:airplane];
    
    // Inserto en la vista principal
    [self.view addSubview:_airplaneImageView];
    
    
    
    // Llamo a las funciones
    [self startRayoAnimation];
    [self startParachuteAnimation];
    [self startAirplaneAnimation:5.0f];
}

- (void) startRayoAnimation {

    // Tengo dos imágenes
    UIImage *rayo1 = [UIImage imageNamed:@"rayo1.png"];
    UIImage *rayo2 = [UIImage imageNamed:@"rayo2.png"];
    
    // Inicializo la imageView con la primera imagen
    _rayoImageView = [[UIImageView alloc] initWithImage:rayo1];
    
    // Le doy un tamaño
    [_rayoImageView setFrame:CGRectMake(self.view.bounds.size.width/4, 30.0f, 150.0f, 100.0f)];
    
    // La inserto en la vista principal
    [self.view addSubview:_rayoImageView];

    // Configuro una animación de intercambio de imágenes
    [_rayoImageView setAnimationImages:[NSArray arrayWithObjects: rayo1, rayo2, nil]];
	[_rayoImageView setAnimationDuration:0.4];
	[_rayoImageView setAnimationRepeatCount:0];

    // Empiezo la animación
    [_rayoImageView startAnimating];
}

- (void) startParachuteAnimation {

    CGRect frameInicial = CGRectMake(0.0f, 30.0f, 100.0f, 100.0f);
    CGRect frameFinal = CGRectMake(self.view.bounds.size.width-100, self.view.bounds.size.height-100, 100.0f, 100.0f);

    // Le asigno el frame inicial a la imageView
    [_parachuteImageView setFrame:frameInicial];
    
    // Empiezo con una animación de vista
    [UIView beginAnimations:nil context:nil];
    
    // Configuro la animación
    [UIView setAnimationDuration:5.0f];
    
    // Le asigno el frame final a la imageView
    [_parachuteImageView setFrame:frameFinal];
    
    // Finalizo la animación para que la imageView pase del frame inicial al final
    [UIView commitAnimations];
}

- (void) startAirplaneAnimation:(CGFloat)startDelay {

    // Otra forma de definir un CGRect
    CGRect frameInicial;
    frameInicial.origin.x = 0;
    frameInicial.origin.y = self.view.bounds.size.height - 100;
    frameInicial.size = CGSizeMake(160.0f, 100.0f);
    
    CGRect frameFinal;
    frameFinal.origin.x = self.view.bounds.size.width - 100;
    frameFinal.origin.y = 0;
    frameFinal.size = CGSizeMake(160.0f, 100.0f);
    
    // Deshago las transformaciones
    [_airplaneImageView setTransform:CGAffineTransformIdentity];
    
    // Pongo la transparencia inicial
    [_airplaneImageView setAlpha:1.0f];

    // Le asigno el frame inicial a la imageView
    [_airplaneImageView setFrame:frameInicial];
    
    // Empiezo con una animación de vista
    [UIView beginAnimations:nil context:nil];
    
    // Configuro la animación
    [UIView setAnimationDuration:5.0f];
    [UIView setAnimationDelay:startDelay];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(imageViewDidStop)];
    
    // Le asigno el frame final a la imageView
    [_airplaneImageView setFrame:frameFinal];
    
    // Aplico la transformación de escalado
    [_airplaneImageView setTransform:CGAffineTransformMakeScale(0.3f, 0.3f)];
    [_airplaneImageView setAlpha:0.0f];
    
    // Finalizo la animación para que la imageView pase del frame inicial al final
    [UIView commitAnimations];
}

- (void) imageViewDidStop {
    
    UIAlertController *alerta = [UIAlertController alertControllerWithTitle:@"Pregunta"
                                                                    message:@"¿Volver a ver la animación?"
                                                             preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *accionSi = [UIAlertAction actionWithTitle:@"Sí"
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * _Nonnull action) {
                                                        [self startParachuteAnimation];
                                                        [self startAirplaneAnimation:5.0f];
                                                    }];
    UIAlertAction *accionNo = [UIAlertAction actionWithTitle:@"No"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         [_rayoImageView stopAnimating];
                                                     }];

    [alerta addAction:accionSi];
    [alerta addAction:accionNo];

    [self presentViewController:alerta animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
