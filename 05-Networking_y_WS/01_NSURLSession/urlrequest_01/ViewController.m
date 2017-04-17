//
//  ViewController.m
//  urlrequest_01
//
//  Created by IVAN MOLERA on 6/12/16.
//  Copyright © 2016 UAB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // SESSION

    NSURLSession *session = [NSURLSession sharedSession];
    
    
    // DATA TASK
    
    NSString *stringURL = @"http://www.apple.com";

    NSURL *url = [NSURL URLWithString:stringURL];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];


    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {

                                      if(error == nil) {
                                          NSLog(@"%@", data);

                                          NSString *stringData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

                                          NSLog(@"%@", stringData);
                                      }
                                      else {
                                          // TODO: gestionar el error
                                      }
                                      
                                  }];
    
    [task resume];
    
    
    
    
    // DOWNLOAD TASK
    NSString *logoURL = @"https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Apple_Computer_Logo_rainbow.svg/931px-Apple_Computer_Logo_rainbow.svg.png";

    NSURL *downloadURL = [NSURL URLWithString:logoURL];

    NSURLRequest *request2 = [NSURLRequest requestWithURL:downloadURL];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request2
                                                            completionHandler:
                                              ^(NSURL *location, NSURLResponse *response, NSError *error) {

                                                  if(error == nil) {
                                                  
                                                      // Recuperamos el directorio de documentos
                                                      NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
                                                  
                                                  
                                                      // Creamos la URL del directorio
                                                      NSURL *documentsDirectoryURL = [NSURL fileURLWithPath:documentsPath];
                                                      
                                                      // A partir de ese directorio creamos una URL para el fichero descargado
                                                      NSURL *documentURL = [documentsDirectoryURL URLByAppendingPathComponent:[response
                                                                                                                           suggestedFilename]];
                                                      
                                                      // Movemos el fichero temporal a su ubicación definitiva
                                                      [[NSFileManager defaultManager] moveItemAtURL:location
                                                                                              toURL:documentURL
                                                                                              error:nil];
                                                  
                                                  
                                                      // A partir de aquí seguimos la ejecución en el thread principal
                                                      dispatch_async(dispatch_get_main_queue(), ^{
                                                  
                                                        UIImage *logo = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:documentURL]];
                                                  
                                                        UIImageView *logoView = [[UIImageView alloc] init];
                                                  
                                                        [logoView setCenter:self.view.center];
                                                        [logoView setFrame:self.view.frame];
                                                        [logoView setContentMode:UIViewContentModeScaleAspectFit];
                                                        [logoView setImage:logo];
                                                  
                                                        [self.view addSubview:logoView];
                                                      });
                                                  }
                                              }];
    
    [downloadTask resume];
 
    
    
    // UPLOAD TASK
    /*
    NSURL *uploadURL = [NSURL URLWithString:@"http://example.com/upload"];
    NSURLRequest *request3 = [NSURLRequest requestWithURL:uploadURL];
    NSData *data = [[NSData alloc] init];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"nombreFichero" ofType:@"json"];
    
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];

    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request3
                                                               fromData:fileData
                                                      completionHandler:
                                          ^(NSData *data, NSURLResponse *response, NSError *error) {
                                              
                                              if(error == nil) {
                                                  NSLog(@"%@", data);
                                              }
                                          }];
    
    [uploadTask resume];
    */

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
