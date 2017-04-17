//
//  ViewController.m
//  AudioPlayer
//
//  Created by IVAN MOLERA on 27/11/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import "ViewController.h"
#import "SoundManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // Path del fichero de audio
    NSString *path = [[NSBundle mainBundle] pathForResource:@"number5" ofType:@"wav"];
    
    // Monto la url a partir del path
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:path];
    
    // Inicializo el audio player
    _audio = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    
    // Configuro el audio player
    // Para que nuestra clase sea delegate debe cumplir el protocolo <AVAudioPlayerDelegate>
    [_audio setVolume:1.0f];
    [_audio setDelegate:self];
    
    // Precarga en memoria del audio
    [_audio prepareToPlay];
    
    // Reproducción del audio
    [_audio play];
}

// Cuando el audio player finalize la reproducción de number5.wav pasaremos por éste método
- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {

    // Lo mismo que antes usando SoundManager
    [[SoundManager sharedManager] playSound:@"number6.wav"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
