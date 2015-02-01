//
//  PlayWithDictionaryTests.m
//  PlayWithDictionaryTests
//
//  Created by Kate Polyakova on 2/1/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "UserInfo.h"

static NSString *const TARGET_BITCOIN_ID = @"1C14TpbkGWeLQazm84JhX2yjBA4fbAN4E9";

@interface PlayWithDictionaryTests : XCTestCase

@end

@implementation PlayWithDictionaryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {

}

- (void)testPerformance_searchInArray {

    [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{

        //загружаем наш массив, в котором будем искать
        NSMutableArray *preparedArray = [self buildPreparedArray];

        [self startMeasuring]; //начало выполнения
        // выполнение поиска
        __block UserInfo *targetObject;

        [TestUtils performBlock: ^() {

            int targetIndex = [preparedArray indexOfObjectPassingTest:^BOOL(UserInfo * obj, NSUInteger idx, BOOL *stop) {
                return [obj.bitcoin isEqualToString:TARGET_BITCOIN_ID];
            }];

            if(targetIndex != NSNotFound){
                targetObject = preparedArray[targetIndex];
            }

        } nTimes:1000];

        [self stopMeasuring]; //конец выполнения

        NSLog(@"%@", targetObject);

    }];

}

- (NSMutableArray *)buildPreparedArray {
    NSArray *rawData = [TestUtils loadRawDataArray];

    NSMutableArray *preparedArray = [[NSMutableArray alloc] initWithCapacity:rawData.count];
    for(NSDictionary *dict in rawData) {
            UserInfo *userInfo = [UserInfo infoWithDictionary:dict];
            [preparedArray addObject:userInfo];
        }
    return preparedArray;
}

- (void)testPerformance_searchInDictionary {

    [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{

        NSDictionary *preparedDictionary = [self buildPreparedDictionary];

        [self startMeasuring];

        __block UserInfo *targetObject;
        [TestUtils performBlock: ^() {
            targetObject = preparedDictionary[TARGET_BITCOIN_ID];
        } nTimes:1000];


        [self stopMeasuring];

        NSLog(@"%@", targetObject);
    }];



}

- (NSDictionary *)buildPreparedDictionary {

    NSArray *rawData = [TestUtils loadRawDataArray];

    NSMutableDictionary *result = [[NSMutableDictionary alloc] initWithCapacity:rawData.count];
    for (NSDictionary *dict in rawData) {
        UserInfo *info = [UserInfo infoWithDictionary:dict];
        result[info.bitcoin] = info; // [result setObject:info forKey:info.bitcoin];

    }

    return result;


}

@end
