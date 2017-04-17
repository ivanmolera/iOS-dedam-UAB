//
//  ViewController.m
//  primeraApp
//
//  Created by IVAN MOLERA on 1/11/15.
//  Copyright © 2015 UAB. All rights reserved.
//

#import "ViewController.h"
#import "Persona.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%d", MI_CONSTANTE);
    
    Persona *ivan = [[Persona alloc] init];
    
    ivan.nombre = @"Ivan";
    ivan.apellidos = @"Molera";
    ivan.altura = 180.0f;
    
    [ivan caminaAKmPorHora:3.0f];
    [ivan correA10KmPorHora];

    
    NSMutableArray *arrMut = [[NSMutableArray alloc] init];
    
    [arrMut addObject:@"pos1"];
    [arrMut addObject:@"pos2"];
    [arrMut addObject:@"pos3"];
    
    for (int i=0; i<[_arr count]; i++) {
        NSString *str = [_arr objectAtIndex:i];
        NSLog(@"%@", str);
    }
    
    for (NSString *str in _arr) {
        NSLog(@"%@", str);
    }
    
    NSLog(@"%@", [arrMut objectAtIndex:1]);
    
    NSArray *objs = [[NSArray alloc] initWithObjects:@"string1", @"string2", @"string3", nil];
    NSArray *keys = [[NSArray alloc] initWithObjects:@"pos1", @"pos2", @"pos3", nil];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjects:objs forKeys:keys];
    
    NSLog(@"%@", dict[@"pos2"]);
    
    NSMutableDictionary *dictMut = [[NSMutableDictionary alloc] init];
    
    dictMut[@"pos1"] = @"string1";
    dictMut[@"pos2"] = @"string2";
    dictMut[@"pos3"] = @"string3";
    
    NSLog(@"%@", dictMut);
    
    NSSet *shoppingList = [[NSSet alloc] initWithObjects:
                           @"Cereales",
                           @"Fruta",
                           @"Pan",
                           @"Arroz", nil];
    
    NSMutableSet *mutableList = [NSMutableSet setWithSet:shoppingList];
    
    [mutableList addObject:@"Yogurt"];
    [mutableList removeObject:@"Pan"];
}

- (void) viewDidAppear:(BOOL)animated {
    UIAlertController *alerta = [UIAlertController alertControllerWithTitle:@"ALERTA!!!"
                                                                    message:@"Mensaje"
                                                             preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alerta animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
