//
//  SaberSoundsModel.m
//  sablelaser
//
//  Created by Raúl Flores on 24/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SaberSoundsModel.h"
#import <AVFoundation/AVFoundation.h>

@implementation SaberSoundsModel
@synthesize saberSoundsArray=_saberSoundsArray;

-(id)init
{
    if ((self = [super init])) 
    {
        //array con todos los nombres de los archivos de sonido
        filesArray = [NSArray arrayWithObjects:@"sabramb1.wav",
                      @"ltsaberon01.wav",
                      @"ltsaberoff01.wav",
                      @"sabrswg1.wav",
                      @"sabrswg2.wav",
                      @"sabrswg6.mp3",
                      @"sabrswg4.mp3",
                      @"sabhit1.WAV",
                      @"sabhit2.WAV",
                      @"sabhit3.WAV",
                      @"ltsaberhit15.wav",
                      @"espadazo1.wav",
                      @"espadazo2.wav",
                      @"espadazo3.wav",
                      
                      nil];
        
       
        //array que contendrá los objetos de sonidos
        self.saberSoundsArray = [NSMutableArray arrayWithObjects: nil];
        
        for (int i=0; i<[filesArray count]; i++) 
            
        {
            
            
            NSString *file = [NSString stringWithFormat:@"%@", [[filesArray objectAtIndex:i] description]  ];
            
            
            NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],file]];
            
            
            
            AVAudioPlayer *sound = [[AVAudioPlayer alloc]  initWithContentsOfURL:url error:nil] ;

                        
            [_saberSoundsArray addObject:sound];
           
            
            
            
        }
        //NSLog(@"saberSoundsArray: %@",[_saberSoundsArray description]);
        
        
        
    }
    
    return self;
    
}



@end
