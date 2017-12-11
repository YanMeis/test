//
//  YMNetConfig.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMNetConfig.h"

@implementation YMNetConfig

- (instancetype)init
{
    self = [super init];
    if (self) {
        //        _baseUrl = @"http://api.open.dfthlong.com";
        //        _debug = false;
//#ifdef DEBUG
        _baseUrl = @"http://apitest.open.dfthlong.com";
        //        _baseUrl = @"http://apidev.open.dfthlong.com";
        //        _baseUrl = @"http://192.168.1.53:10884";
//        _debug = true;
//#else
//        _baseUrl = @"http://api.open.dfthlong.com";
//        _debug = false;
//#endif
        _timeout = 5;
    }
    return self;
}

@end
