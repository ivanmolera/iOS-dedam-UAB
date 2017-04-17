//
//  ViewController.h
//  VideoCameraApp
//
//  Created by IVAN MOLERA on 14/12/13.
//  Copyright (c) 2013 UAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) NSURL *movieURL;
@property (nonatomic, strong) AVPlayerViewController *movieController;

- (IBAction)takeVideo:(id)sender;
- (IBAction)selectVideo:(id)sender;

@end
