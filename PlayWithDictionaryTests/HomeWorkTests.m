//
//  HomeWorkTests.m
//  PlayWithDictionary
//
//  Created by Kate Polyakova on 2/28/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSDictionary+TestUtils.h"
#import "NSArray+Testutils.h"
#import "UserInfo.h"
#import "TestUtils.h"
#import "UserInfoFilter.h"

@interface HomeWorkTests : XCTestCase

@end

@implementation HomeWorkTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLiteral {
    NSArray *array1 = @[@"One",@"Two",@"Three",@"Four",@"Five",@"Six",@"Seven"];
    [array1 logArray];
    NSArray *array2 = @[@1,@2,@3,@4,@5];
    [array2 logArray];
    NSDictionary *dictionary = @{@"full name":@"Tina Stanley",
            @"date":[NSDate date],
            @"zip":@62705,
            @"country":@"United States"};
    [dictionary logDictionary];

}

- (void)testArrayPlist {
    NSArray *films2015 = [self getArrayData];
    //enumeration in "for" loop
    NSLog(@"\nenumeration in \"for\" loop in array");
    for (NSUInteger i = 0; i < films2015.count; i++) {
        NSLog(@"%@", films2015[i]);

        // how to realize 'break' here
        if (i==1) {
            break;
        }
    }
    //fast enumeration
    NSLog(@"\nfast enumeration in array");
    for (NSString *item in films2015) {
        NSLog(@"%@", item);

        // how to realize 'break' here
        NSUInteger index = [films2015 indexOfObject:item];
        if (index==1) {
            break;
        }
    }
    //enumeration with block
    NSLog(@"\nenumeration with block in array");
    [films2015 enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@", obj);

        // how to realize 'break' here
        if (idx==1) {
            *stop = YES;
        }
    }];

    [films2015 logArray];
}

- (NSArray *) getArrayData {
    return [NSArray loadTestListByName:@"NewFilms" clazz:[HomeWorkTests class]];
}

- (void)testDictionaryPlist {

    NSBundle * bundle = [NSBundle bundleForClass:[HomeWorkTests class]];
    NSString *path = [bundle pathForResource:@"PhoneBook" ofType:@"plist"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:url];

    //enumeration with block
    NSLog(@"\nenumeration with block in dictionary");
    [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
        NSLog(@"key[%@] : value [%@]", key , obj);
    }];

    //fast enumeration
    NSLog(@"\nfast enumeration in dictionary");
    NSArray *arrayKeys = [dictionary allKeys];
    for (NSString *item in arrayKeys){
        NSLog(@"key[%@] : value [+%@]", item, dictionary[item]);
    }

}

- (void)testDictionaryAddData {

    NSDictionary *dictionary = @{@"full name":@"Tina Stanley",
            @"date":[NSDate date],
            @"zip":@62705,
            @"country":@"United States"};


    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setDictionary:@{@"data":[NSData data],
            @"phone number":@9094664360,
            @"city":@"New York"}];
    [dict logDictionary];
    NSLog (@"\n");

    [dict addEntriesFromDictionary:dictionary];
    [dict logDictionary];
    NSLog (@"\n");

    [dict setValue:@"Robert" forKey:@"children name"];
    dict[@"user"] = @"tinaSt16@nature.com";
    dict[@"bitcoins"] = [NSNull null];
    dict[@"derived"] = [UserInfo infoWithZip:@"61195" country:@"Ukrain" city:@"Kharkov" address:@"N/A" user:@"Katrin" bitcoin:nil];

    [dict logDictionary];
}

-(void)testEmptyZipCodeFilter {
    NSArray *users = [TestUtils buildPreparedArray];
    NSArray *filteredUsers = [[[UserInfoFilter alloc] initWithUsers:users] filterNoZipCode];

    [filteredUsers logArrayTopN:10];
}

- (void) testFilterByName {
    NSArray *users = [TestUtils buildPreparedArray];
    NSArray *filteredUsers = [[[UserInfoFilter alloc] initWithUsers:users] filterNameStartWith:@"w"];

    [filteredUsers logArrayTopN:10];
}

- (void) testFilterByCountries {
    NSArray *users = [TestUtils buildPreparedArray];
    NSArray *filteredUsers = [[[UserInfoFilter alloc] initWithUsers:users] filterByAfricaAndSA];

    [filteredUsers logArrayTopN:10];

}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
