//
//  AppDelegate.h
//  sablelaser
//
//  Created by Raúl Flores on 22/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SaberSoundsModel;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    
    SaberSoundsModel *saberSoundsModel;
}

@property (strong, nonatomic) UIWindow *window;

@end
