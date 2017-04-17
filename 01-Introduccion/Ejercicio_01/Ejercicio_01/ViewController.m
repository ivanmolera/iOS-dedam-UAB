//
//  ViewController.m
//  Ejercicio_01
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
    
    
    _array = [[NSArray alloc] initWithObjects:@"string1", @"string2", @"string3", @"string4", nil];
    _position = 0;
    
    
    _alerta = [UIAlertController alertControllerWithTitle:@"ALERTA!!!"
                                                  message:[NSString stringWithFormat:@"Posicion %ld: %@", (long)_position, [_array objectAtIndex:_position]]
                                           preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *siguiente = [UIAlertAction
                                actionWithTitle:@"Siguiente"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    _position++;
                                    [self resetAlerta];
                                }];
    
    [_alerta addAction:siguiente];
    
    UIAlertAction *anterior = [UIAlertAction
                               actionWithTitle:@"Anterior"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   _position--;
                                   [self resetAlerta];
                               }];
    
    [_alerta addAction:anterior];
}

- (void) viewDidAppear:(BOOL)animated {

    [self presentViewController:_alerta animated:YES completion:nil];
}

- (void) resetAlerta {
    _position = [self checkIndex:_position];
    [_alerta setMessage:[NSString stringWithFormat:@"Posicion %d: %@", (int)_position, [_array objectAtIndex:_position]]];
    [self presentViewController:_alerta animated:YES completion:nil];
}

- (NSInteger) checkIndex:(NSInteger) index {
    if(index < 0) {
        index = 0;
    }
    if(index >= [_array count]) {
        index = [_array count]-1;
    }

    return index;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
