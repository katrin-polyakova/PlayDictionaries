//
// Created by Kate Polyakova on 2/1/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "UserInfo.h"


@implementation UserInfo {

}
- (instancetype)initWithZip:(NSString *)zip country:(NSString *)country city:(NSString *)city address:(NSString *)address user:(NSString *)user bitcoin:(NSString *)bitcoin {
    self = [super init];
    if (self) {
        self.zip = zip;
        self.country = country;
        self.city = city;
        self.address = address;
        self.user = user;
        self.bitcoin = bitcoin;
    }

    return self;
}

+ (instancetype)infoWithZip:(NSString *)zip country:(NSString *)country city:(NSString *)city address:(NSString *)address user:(NSString *)user bitcoin:(NSString *)bitcoin {
    return [[self alloc] initWithZip:zip country:country city:city address:address user:user bitcoin:bitcoin];
}

+ (instancetype)infoWithDictionary: (NSDictionary *) dict {
    UserInfo *result = [self infoWithZip:dict[@"zip"]
                                 country:dict[@"country"]
                                    city:dict[@"city"]
                                 address:dict[@"address"]
                                    user:dict[@"user"]
                                 bitcoin:dict[@"bitcoin"]];
    return result;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.zip=%@", self.zip];
    [description appendFormat:@", self.country=%@", self.country];
    [description appendFormat:@", self.city=%@", self.city];
    [description appendFormat:@", self.address=%@", self.address];
    [description appendFormat:@", self.user=%@", self.user];
    [description appendFormat:@", self.bitcoin=%@", self.bitcoin];
    [description appendString:@">"];
    return description;
}


@end