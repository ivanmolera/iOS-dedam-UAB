//
//  ViewController.m
//  VideoCameraApp
//
//  Created by IVAN MOLERA on 14/12/13.
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

- (void) viewDidAppear:(BOOL)animated {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertController *alerta = [UIAlertController alertControllerWithTitle:@"Error"
                                                                        message:@"Dispositivo sin cámara"
                                                                 preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil];
        
        [alerta addAction:ok];
        
        [self presentViewController:alerta animated:YES completion:nil];
    }
    else {

        AVAsset *asset = [AVAsset assetWithURL:_movieURL];
        AVPlayerItem *item = [[AVPlayerItem alloc] initWithAsset:asset];
        
        AVPlayer *player = [[AVPlayer alloc] initWithPlayerItem:item];
        
        [player setActionAtItemEnd:AVPlayerActionAtItemEndNone];
        [player setVolume:1.0f];
        
        _movieController = [AVPlayerViewController new];
        
        [_movieController setPlayer:player];
        [_movieController setShowsPlaybackControls:NO];
        
        [_movieController.view setFrame:CGRectMake(0, 0, 320, 380)];
        
        [self.view addSubview:_movieController.view];
        
        [_movieController.player play];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takeVideo:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.allowsEditing = YES;
    picker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)selectVideo:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing = YES;
    picker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
    
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    _movieURL = info[UIImagePickerControllerMediaURL];
    
    if(picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        NSString *moviePath = [_movieURL path];
        UISaveVideoAtPathToSavedPhotosAlbum(moviePath, nil, nil, nil);
    }
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
@end
