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
    }
    //fast enumeration
    NSLog(@"\nfast enumeration in array");
    for (NSString *item in films2015) {
        NSLog(@"%@", item);
    }
    //enumeration with block
    NSLog(@"\nenumeration with block in array");
    [films2015 enumerateObjectsUsingBlock:^(NSString *item, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@", item);
    }];

    [films2015 logArray];
}

- (void)testDictionaryPlist {

    NSBundle * bundle = [NSBundle bundleForClass:[HomeWorkTests class]];
    NSString *path = [bundle pathForResource:@"PhoneBook" ofType:@"plist"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:url];

    //enumeration with block
    NSLog(@"\nenumeration with block in dictionary");
    [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
        NSLog(@"%@ : %@", key , obj);
    }];

    //fast enumeration
    NSLog(@"\nfast enumeration in dictionary");
    NSArray *arrayKey = [dictionary allKeys];
    for (NSString *item in arrayKey){
        NSLog(@"%@ : +%@", item, dictionary[item]);
    }

}

- (NSArray *) getArrayData {
    return [NSArray loadTestListByName:@"NewFilms" clazz:[HomeWorkTests class]];
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
    [dict addEntriesFromDictionary:dictionary];

    [dict setValue:@"Robert" forKey:@"children name"];
    dict[@"user"] = @"tinaSt16@nature.com";
    dict[@"bitcoins"] = [NSNull null];

    [dict logDictionary];
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
