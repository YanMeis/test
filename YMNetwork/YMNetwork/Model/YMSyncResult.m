//
//  YMSyncResult.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMSyncResult.h"

@implementation YMSyncResult

- (instancetype)init
{
    self = [super init];
    if (self) {
        _netResult = [[YMNetResult alloc] init];
    }
    return self;
}

- (NSString *)description{
    return self.mj_keyValues.description;
}

@end
