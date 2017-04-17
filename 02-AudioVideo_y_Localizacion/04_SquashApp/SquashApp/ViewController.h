//
//  ViewController.h
//  SquashApp
//
//  Created by IVAN MOLERA on 27/11/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) AVAudioPlayer *audio;
@property (nonatomic, strong) NSTimer *timer;

@property (weak, nonatomic) IBOutlet UIButton *boton1;
@property (weak, nonatomic) IBOutlet UIButton *boton2;
@property (weak, nonatomic) IBOutlet UIButton *boton3;
@property (weak, nonatomic) IBOutlet UIButton *boton4;
@property (weak, nonatomic) IBOutlet UIButton *boton5;
@property (weak, nonatomic) IBOutlet UIButton *boton6;

@property (strong, nonatomic) IBOutlet UILabel *labelNumero;


- (IBAction)playClick:(id)sender;
- (IBAction)startTimer:(id)sender;
- (IBAction)stopTimer:(id)sender;

@end
