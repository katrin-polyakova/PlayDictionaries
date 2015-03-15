//
// Created by Kate Polyakova on 2/28/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "UserInfoFilter.h"
#import "UserInfo.h"
#import "NSArray+Testutils.h"
#import "TestUtils.h"


@implementation UserInfoFilter {
}
- (instancetype)initWithUsers:(NSArray *)users {
    self = [super init];
    if (self) {
        self.users = users;
    }

    return self;
}

+ (instancetype)filterWithUsers:(NSArray *)users {
    return [[self alloc] initWithUsers:users];
}

-(NSArray *)filterByAfricaAndSA{

    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:@"CountriesAfricaAndSA" ofType:@"plist"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSArray *countries = [NSArray arrayWithContentsOfURL:url];

    NSSet *targetCountries = [NSSet setWithArray:countries];

    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(UserInfo *evaluatedObject, NSDictionary *bindings){
        return [targetCountries containsObject:evaluatedObject.country];
    }];
    NSArray *result = [self.users filteredArrayUsingPredicate:predicate];
    return result;
}

-(NSArray *)filterNameStartWith:(NSString *) prefix {

    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(UserInfo *evaluatedObject, NSDictionary *bindings){
        return [evaluatedObject.user hasPrefix:prefix];
    }];
    NSArray *result = [self.users filteredArrayUsingPredicate:predicate];
    return result;

}

-(NSArray *)filterNoZipCode{

    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(UserInfo *evaluatedObject, NSDictionary *bindings) {
        return evaluatedObject.zip.length == 0;
    }];
    NSArray *result = [self.users filteredArrayUsingPredicate:predicate];
    return result;

}

//
//- (void)filteredArrayByCountries {
//
//    NSMutableArray *preparedArray = [self buildPreparedArray];
//    NSArray *array = [NSArray loadTestListByName:@"CountriesAfricaAndSA" clazz:[self class]];
////    NSArray *countries = array;
//
//    NSSet *countries = [NSSet setWithArray:array];
////   [countries logArray];
//
//    NSMutableArray *finalArray = [NSMutableArray array];
//
//    for (UserInfo *info in preparedArray) {
//        if ([countries containsObject:info.country]) {
//            [finalArray addObject:info];
//        }
//    }
//
//}

@end