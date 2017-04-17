//
//  ViewController.m
//  JSON
//
//  Created by IVAN MOLERA on 15/12/13.
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
    
    ///// DEFINICIÓN /////
    
    NSDictionary *dictionary =
    @{
      @"First Name" : @"Anthony",
      @"Last Name" : @"Robbins",
      @"Age" : @51,
      @"children" : @[
            @"Anthony's Son 1",
            @"Anthony's Daughter 1",
            @"Anthony's Son 2",
            @"Anthony's Son 3",
            @"Anthony's Daughter 2"
            ],
    };
    
    
    ///// SERIALIZATION //////
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if ([jsonData length] > 0 && error == nil){
        NSLog(@"Éxito al serializar el diccionario = %@",
              jsonData);
    }
    else if ([jsonData length] == 0 && error == nil){
        NSLog(@"No hay data tras la serialización.");
    }
    else if (error != nil){
        NSLog(@"Ha ocurrido un error = %@", error);
    }
    
    
    NSLog(@"%@", [[NSString alloc] initWithData:jsonData
                                       encoding:NSUTF8StringEncoding]);
    
    
    ///// DESERIALIZATION /////

    error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    
    if (jsonObject != nil && error == nil){
        
        NSLog(@"Éxito al deserializar...");
        if ([jsonObject isKindOfClass:[NSDictionary class]]){
            
            NSDictionary *deserializedDictionary = jsonObject;
            NSLog(@"Deserializado un JSON Dictionary = %@", deserializedDictionary);
            
        }
        else if ([jsonObject isKindOfClass:[NSArray class]]){
            
            NSArray *deserializedArray = (NSArray *)jsonObject;
            NSLog(@"Deserializado un JSON Array = %@", deserializedArray);
            
        }
    }
    else if (error != nil){
        NSLog(@"Error deserializando los datos JSON.");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
