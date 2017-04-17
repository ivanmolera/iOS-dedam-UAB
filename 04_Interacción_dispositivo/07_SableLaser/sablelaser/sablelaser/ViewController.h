//
//  ViewController.h
//  sablelaser
//
//  Created by Raúl Flores on 22/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SaberOnViewController.h"
//añadimos este framework para que se pueda acceder a la vibración
#import <AudioToolbox/AudioToolbox.h>


@interface ViewController : UIViewController <SaberOnViewControllerDelegate>{
    
    NSMutableArray *saberSoundsArray; 
    
}
@property (nonatomic, strong)  NSMutableArray *saberSoundsArray;
- (IBAction)startLaser:(id)sender;

@end
