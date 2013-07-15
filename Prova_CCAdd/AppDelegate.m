//
//  AppDelegate.m
//  Prova_CCAdd
//
//  Created by P_VaG on 11/07/13.
//  Copyright (c) 2013 Carlo Carlucci. All rights reserved.
//

#import "AppDelegate.h"
#import "Control.h"

#define kSavedDataFileName @"savedData"


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self.mathController loadDataFromFile];
}

- (void)applicationWillTerminate:(NSNotification *)notification {
    [self.mathController storeDataToFile];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end
