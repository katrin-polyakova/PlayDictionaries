//
// Created by Kate Polyakova on 2/1/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TestUtils : NSObject

+ (NSMutableArray *)loadRawDataArray;

+ (void)performBlock:(void (^)())pFunction nTimes:(int)times;
@end