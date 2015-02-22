//
// Created by Kate Polyakova on 2/22/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "BadAddressKey.h"


@implementation BadAddressKey {

}

- (NSUInteger)hash {

//    NSUInteger hash = [self.country length];
//    hash += [self.city length]; // hash = hash + [self.city length]
//    hash += [self.address length]; // hash = hash + [self.address length]

//    NSUInteger hash = [self.country length];
//    hash = hash * [self.city characterAtIndex:0] * [self.address characterAtIndex:0];

    NSUInteger hash = [self.country characterAtIndex:0] * [self.city characterAtIndex:0] * [self.address characterAtIndex:0];

    return hash;
}

@end