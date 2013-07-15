//
//  MathModel.m
//  Prova_CCAdd
//
//  Created by Carlo Carlucci on 11/07/13.
//  Copyright (c) 2013 Carlo Carlucci. All rights reserved.
//

#import "MathModel.h"

#define kSumOperatorImageFileName @"plus"
#define kSubtractionOperatorImageFileName @"minus"
#define kMultiplicationOperatorImageFileName @"multiplication"
#define kDivisionOperatorImageFileName @"division"
#define kSumOperatorTag 0
#define kSubtractionOperatorTag 1
#define kMultiplicationOperatorTag 2
#define kDivisionOperatorTag 3

#define kFirstNumber @"firstNumber"
#define kSecondNumber @"secondNumber"
#define kResult @"result"
#define kOperatorImageFileName @"operatorImageFileName"


@interface MathModel (PrivateInterface)

@end


@implementation MathModel

- (void)addNumbers {
	self.result = self.firstNumber + self.secondNumber;
}

- (void)subtractNumbers {
    self.result = self.firstNumber - self.secondNumber;
}

- (void)multiplyNumbers {
    self.result = self.firstNumber * self.secondNumber;
}

- (void)divideNumbers {
    self.result = self.firstNumber / self.secondNumber;
}

/*
- (void)performOperationWithOperator:(NSString *)op {
    if ([op isEqualToString:@"Add"]) {
        [self addNumbers];
        // Load the image from the file into an NSImage object
        self.operatorImage = [NSImage imageNamed:kSumOperatorImageFileName];
    }
    else if ([op isEqualToString:@"Subtract"]) {
        [self subtractNumbers];
    }
    else if ([op isEqualToString:@"Multiply"]) {
        [self multiplyNumbers];
    }
    else if ([op isEqualToString:@"Divide"]) {
        [self divideNumbers];
    }
}
*/

- (void)performOperationWithOperatorTag:(NSInteger)tag {
    switch (tag) {
        case kSumOperatorTag: {
            [self addNumbers];
            self.operatorImageFileName = kSumOperatorImageFileName;
            break;
        }
        case kSubtractionOperatorTag: {
            [self subtractNumbers];
            self.operatorImageFileName = kSubtractionOperatorImageFileName;
            break;
        }
        case kMultiplicationOperatorTag: {
            [self multiplyNumbers];
            self.operatorImageFileName = kMultiplicationOperatorImageFileName;
            break;
        }
        case kDivisionOperatorTag: {
            [self divideNumbers];
            self.operatorImageFileName = kDivisionOperatorImageFileName;
            break;
        }
    }
}


#pragma mark -
#pragma mark NSCoding methods

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:[NSNumber numberWithFloat:self.firstNumber]
                  forKey:kFirstNumber];
    [aCoder encodeObject:[NSNumber numberWithFloat:self.secondNumber]
                  forKey:kSecondNumber];
    [aCoder encodeObject:[NSNumber numberWithFloat:self.result]
                  forKey:kResult];
    [aCoder encodeObject:self.operatorImageFileName
                  forKey:kOperatorImageFileName];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.firstNumber = [[aDecoder decodeObjectForKey:kFirstNumber] floatValue];
        self.secondNumber = [[aDecoder decodeObjectForKey:kSecondNumber] floatValue];
        self.result = [[aDecoder decodeObjectForKey:kResult] floatValue];
        self.operatorImageFileName = [aDecoder decodeObjectForKey:kOperatorImageFileName];
    }
    return self;
}

#pragma mark NSCopying methods

- (id)copyWithZone:(NSZone *)zone {
    MathModel *mathModelCopy = [[[self class] allocWithZone:zone] init];
    mathModelCopy.firstNumber = self.firstNumber;
    mathModelCopy.secondNumber = self.secondNumber;
    mathModelCopy.result = self.result;
    mathModelCopy.operatorImageFileName = self.operatorImageFileName;
    
    return mathModelCopy;
}

@end
