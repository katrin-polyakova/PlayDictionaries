//
// Created by Kate Polyakova on 2/28/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserInfo;


@interface UserInfoFilter : NSObject

@property NSArray *users;

- (instancetype)initWithUsers:(NSArray *)users;
+ (instancetype)filterWithUsers:(NSArray *)users;


- (NSArray *)filterByAfricaAndSA;
- (NSArray *)filterNameStartWith:(NSString *)prefix;
- (NSArray *)filterNoZipCode;


@end