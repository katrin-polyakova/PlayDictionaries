//
// Created by Kate Polyakova on 2/1/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import <Foundation/Foundation.h>

//{"zip":"312 31",
// "country":"Sweden",
// "city":"Laholm",
// "address":"2384 Magdeline Lane",
// "user":"agreen2@163.com",
// "bitcoin":"1BDnspqCqmpZVCabRh6vHccQCA1r5GMAxg"}


@interface UserInfo : NSObject

@property NSString *zip;
@property NSString *country;
@property NSString *city;
@property NSString *address;
@property NSString *user;
@property NSString *bitcoin;

- (instancetype)initWithZip:(NSString *)zip country:(NSString *)country city:(NSString *)city address:(NSString *)address user:(NSString *)user bitcoin:(NSString *)bitcoin;
+ (instancetype)infoWithZip:(NSString *)zip country:(NSString *)country city:(NSString *)city address:(NSString *)address user:(NSString *)user bitcoin:(NSString *)bitcoin;

+ (instancetype)infoWithDictionary:(NSDictionary *)dict;

- (NSString *)description;



@end