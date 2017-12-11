//
//  User.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithName:(NSString *)name telephone:(NSString *)telephone birthday:(NSTimeInterval)birthday gender:(int)gender
{
    self = [super init];
    if (self) {
        _name = name;
        _telNumber = telephone;
        _birthday = birthday;
        _gender = gender;
    }
    return self;
}

- (instancetype)initWithAccount:(NSString *)account password:(NSString *)password{
    self = [super init];
    if (self) {
        _account = account;
        _password = password;
    }
    return self;
}

- (NSString *)description{
    return self.mj_keyValues.description;
}

@end
