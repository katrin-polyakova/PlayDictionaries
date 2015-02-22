//
// Created by Kate Polyakova on 1/25/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Testutils)

+ (NSArray *)loadTestListByName:(NSString *)listName clazz:(Class)clazz;

- (void)logArray;

- (NSArray *)arrayByRemovingDuplications;

- (NSUInteger)countOfObjectOccurrences:(id)object;

@end