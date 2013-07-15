//
//  MathModel.h
//  Prova_CCAdd
//
//  Created by Carlo Carlucci on 11/07/13.
//  Copyright (c) 2013 Carlo Carlucci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathModel : NSObject <NSCoding, NSCopying>

@property float firstNumber;
@property float secondNumber;
@property float result;
@property NSString *operatorImageFileName;

- (void)addNumbers;
- (void)subtractNumbers;
- (void)multiplyNumbers;
- (void)divideNumbers;

- (void)performOperationWithOperatorTag:(NSInteger)tag;

@end
