//
//  ViewController.m
//  SquashApp
//
//  Created by IVAN MOLERA on 27/11/13.
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
}

- (IBAction)playClick:(id)sender {
    
    // Hago el cast del sender
    UIButton *boton = (UIButton *)sender;
    
    // Voy a buscar la propiedad tag del botón
    long tag = boton.tag;
    
    // Llamo a las funciones de reproducir número y de pintar botón
    [self playNumber:tag];
    [self setButtonColor:tag];
}

- (void) playNumber:(long)num {
    
    // Monto la clave para ir a buscar el literal del número
    NSString *keyLiteral = [NSString stringWithFormat:@"literal%ld", num];
    
    // Pongo el texto en el label
    [_labelNumero setText:NSLocalizedString(keyLiteral, nil)];
    
    // Monto la clave para ir a buscar el audio que toca
    NSString *keyNumero = [NSString stringWithFormat:@"num%ld", num];
    
    // Nombre del fichero según localización
    NSString *filename = NSLocalizedString(keyNumero, nil);
    
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@"wav"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
    
    _audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];

    [_audio setVolume:1.0f];
    
    [_audio prepareToPlay];
    [_audio play];
}

- (void) setButtonColor:(long)num {
    [_boton1 setBackgroundColor:[UIColor clearColor]];
    [_boton2 setBackgroundColor:[UIColor clearColor]];
    [_boton3 setBackgroundColor:[UIColor clearColor]];
    [_boton4 setBackgroundColor:[UIColor clearColor]];
    [_boton5 setBackgroundColor:[UIColor clearColor]];
    [_boton6 setBackgroundColor:[UIColor clearColor]];
    
    switch (num) {
        case 1:
            [_boton1 setBackgroundColor:[UIColor redColor]];
            break;
        case 2:
            [_boton2 setBackgroundColor:[UIColor redColor]];
            break;
        case 3:
            [_boton3 setBackgroundColor:[UIColor redColor]];
            break;
        case 4:
            [_boton4 setBackgroundColor:[UIColor redColor]];
            break;
        case 5:
            [_boton5 setBackgroundColor:[UIColor redColor]];
            break;
        case 6:
            [_boton6 setBackgroundColor:[UIColor redColor]];
            break;
            
        default:
            break;
    }
}

- (IBAction)startTimer:(id)sender {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                              target:self
                                            selector:@selector(playRandomNumber)
                                            userInfo:nil
                                             repeats:YES];
}

- (IBAction)stopTimer:(id)sender {
    if(_timer != nil) {
        [_timer invalidate];
    }
}

- (void) playRandomNumber {
    int num = [self getRandomNumberBetween:1 to:6];
    [self playNumber:num];
    [self setButtonColor:num];
}

- (int)getRandomNumberBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
