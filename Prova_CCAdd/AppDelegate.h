//
//  AppDelegate.h
//  Prova_CCAdd
//
//  Created by P_VaG on 11/07/13.
//  Copyright (c) 2013 Carlo Carlucci. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Control;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
// An outlet to the controller object in the nib
@property (strong, nonatomic) IBOutlet Control *mathController;

@end
