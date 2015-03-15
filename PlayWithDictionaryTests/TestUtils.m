//
// Created by Kate Polyakova on 2/1/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "TestUtils.h"
#import "UserInfo.h"


@implementation TestUtils {

}
+ (NSMutableArray *)loadRawDataArray {
    
    NSMutableArray *result = [[NSMutableArray alloc] init];

    for(int i=0; i<=23; i++) {
        NSString *name = [NSString stringWithFormat:@"MOCK_DATA(%d)", i];
        [result addObjectsFromArray:[self loadRawArrayByName:name]];
    }
    return result;
}

+ (NSMutableArray *)loadRawArrayByName:(NSString *)name {
    NSMutableArray *result;
    NSBundle *bundle = [NSBundle bundleForClass:self];
    NSString *path = [bundle pathForResource:name ofType:@"json"];
    NSURL *url = [NSURL fileURLWithPath:path];

    NSData *rawData = [NSData dataWithContentsOfURL:url];

    result = [NSJSONSerialization JSONObjectWithData:rawData
                                             options:NSJSONReadingMutableContainers
                                               error:nil];
    return result;
}


+ (void)performBlock:(void (^)())pFunction nTimes:(int)times {
    for(int i=0; i<times; i++){
        pFunction();
    }

}

+ (NSMutableArray *)buildPreparedArray {
    NSArray *rawData = [TestUtils loadRawDataArray];

    NSMutableArray *preparedArray = [[NSMutableArray alloc] initWithCapacity:rawData.count];
    for (NSDictionary *dict in rawData) {
        UserInfo *userInfo = [UserInfo infoWithDictionary:dict];
        [preparedArray addObject:userInfo];
    }
    return preparedArray;
}

@end