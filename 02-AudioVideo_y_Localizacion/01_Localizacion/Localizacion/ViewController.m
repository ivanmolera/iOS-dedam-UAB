//
//  ViewController.m
//  Localizacion
//
//  Created by IVAN MOLERA on 16/11/13.
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

    [_bandera setImage:[UIImage imageNamed:NSLocalizedString(@"bandera", nil)]];
}

- (IBAction)buy:(id)sender
{
    UIAlertController *alerta =
        [UIAlertController alertControllerWithTitle:NSLocalizedString(@"mensaje", nil)
                                            message:NSLocalizedString(@"gracias", nil)
                                     preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
    
    [alerta addAction:action];
    [self presentViewController:alerta animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
