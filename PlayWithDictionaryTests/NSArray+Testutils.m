//
// Created by Kate Polyakova on 1/25/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "NSArray+Testutils.h"


@implementation NSArray (Testutils)

+ (NSArray *)loadTestListByName:(NSString *)listName clazz:(Class)clazz {
    NSBundle *bundle = [NSBundle bundleForClass:clazz];
    NSString *path = [bundle pathForResource:listName ofType:@"plist"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSArray *array = [NSArray arrayWithContentsOfURL:url];
    return array;
}

- (void)logArray {
    NSString *arrayAsString = [self componentsJoinedByString:@"\n"];
    NSLog(@"\nArray, count:%d \n[%@]\n", self.count, arrayAsString);
}

- (NSArray *)arrayByRemovingDuplications {
    NSMutableArray *copyArray = [self mutableCopy];
    for(NSUInteger i=0; i<copyArray.count-1; i++){
        for (NSUInteger a=i+1; a<copyArray.count; a++) {
            if ([copyArray[i] isEqualToString: copyArray[a]]){
                [copyArray removeObjectAtIndex:a];
            }
        }
    }
    return copyArray;
}

- (NSUInteger) countOfObjectOccurrences: (id)object {
    NSUInteger result = 0;
    for(NSUInteger i=0; i<self.count; i++){
        if([object isEqualToString:self[i]]){
            result=result+1;
        }
    }
    return result;
}

@end