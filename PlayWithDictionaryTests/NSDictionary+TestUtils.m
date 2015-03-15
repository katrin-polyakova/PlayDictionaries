//
// Created by Kate Polyakova on 2/27/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "NSDictionary+TestUtils.h"


@implementation NSDictionary (TestUtils)

- (void) logDictionary {
    NSArray *arrayKey = [self allKeys];
    for (NSString *item in arrayKey){
        NSLog(@"%@ : %@", item, self[item]);
    }
}
@end