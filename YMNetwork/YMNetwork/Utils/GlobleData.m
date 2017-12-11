//
//  GlobleData.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "GlobleData.h"

@implementation GlobleData

+ (instancetype)sharedInstance{
    static GlobleData *data;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = [[GlobleData alloc] initPrivate];
    });
    
    return data;
}

- (instancetype)init{
    NSAssert(false, @"no no no...");
    return nil;
}

- (instancetype)initPrivate{
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
