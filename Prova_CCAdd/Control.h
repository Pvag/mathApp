//
//  Control.h
//  Prova_CCAdd
//
//  Created by Carlo Carlucci on 11/07/13.
//  Copyright (c) 2013 Carlo Carlucci. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MathModel;

@interface Control : NSObject

// UI Elements Outlets
@property IBOutlet NSTextField *firstNumberField;
@property IBOutlet NSTextField *secondNumberField;
@property IBOutlet NSTextField *resultNumberField;
@property (weak) IBOutlet NSImageView *operatorImageWell;
@property (strong, nonatomic) NSString *appDataPath;

// The model
@property (strong, nonatomic) MathModel *mathModel;

// Methods
-(IBAction)operatorPressed:(NSButton *)sender;
- (void)updateMathModel;
- (void)updateView;
- (void)storeDataToFile;
- (void)loadDataFromFile;

@end
