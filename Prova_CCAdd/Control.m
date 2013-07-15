//
//  Control.m
//  Prova_CCAdd
//
//  Created by Carlo Carlucci on 11/07/13.
//  Copyright (c) 2013 Carlo Carlucci. All rights reserved.
//

#import "Control.h"
#import "MathModel.h"

#define kSavedDataFileName @"savedData"


@implementation Control

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

- (NSString *)appDataPath {
    if (_appDataPath == nil) {
        NSString *appBundlePath = [[NSBundle mainBundle] bundlePath];
        _appDataPath = [NSString stringWithFormat:@"%@/%@", appBundlePath, kSavedDataFileName];
    }
    return _appDataPath;
}

// The user has pressed an operator button, so now:
// 1. update the model with the values inserted by the user
// 2. perform the operation requested by the user (performed it in the model)
// 3. update the user interface
-(IBAction)operatorPressed:(NSButton *)sender {
    [self updateMathModel];
    //[self.mathModel performOperationWithOperator:sender.title];
    [self.mathModel performOperationWithOperatorTag:sender.tag];
    [self updateView];
}

// Sets the values inserted by the user in the fields inside the model
- (void)updateMathModel {
    self.mathModel.firstNumber = self.firstNumberField.floatValue;
    self.mathModel.secondNumber = self.secondNumberField.floatValue;
}

// Retrieves the result from the model and puts it into the corresponding label
// Instantiates an image based upon image name from the model
// Sets the image inside the image view cell
- (void)updateView {
    // Set the first and the second number fields: this is useful
    // when the app is launched after it has been closed and values
    // have been saved
    self.firstNumberField.floatValue = self.mathModel.firstNumber;
    self.secondNumberField.floatValue = self.mathModel.secondNumber;
    // Set the result field
    self.resultNumberField.floatValue = self.mathModel.result;
    // Set the operator image icon
    NSImage *operatorImage = [NSImage imageNamed:self.mathModel.operatorImageFileName];
    [self.operatorImageWell.cell setImage:operatorImage];
}

- (void)updateMathModelAndView {
    [self updateMathModel];
    [self updateView];
}

- (void)storeDataToFile {
    NSData *dataFromModelObject = [NSKeyedArchiver archivedDataWithRootObject:self.mathModel];
    [dataFromModelObject writeToFile:self.appDataPath atomically:YES];
}

- (void)loadDataFromFile {
    // If the file with the saved values exists,
    // unarchive data from it and display them
    if ([[NSFileManager defaultManager] fileExistsAtPath:self.appDataPath]) {
        // Retrieve the data from the archive
        NSData *dataFromArchivedMathModel = [NSData dataWithContentsOfFile:self.appDataPath];
        // Build the model object from the retrieved data
        self.mathModel = [[NSKeyedUnarchiver unarchiveObjectWithData:dataFromArchivedMathModel] copy];
        // Update the view with the retrieved values
        [self updateView];
    }
    else self.mathModel = [[MathModel alloc] init];
}

@end