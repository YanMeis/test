//
//  YMNetResult.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMNetResult.h"

@implementation YMNetPage

@end

@implementation YMNetResult

- (instancetype)initWithCode:(int)code message:(NSString *)message{
    self = [super init];
    if (self) {
        _result = code;
        _msg = message;
    }
    return self;
}

- (NSString *)description{
    return self.mj_JSONString;
}

+ (YMNetResult *)defaultOk{
    return [[YMNetResult alloc] initWithCode:Net_Ok message:@"请求成功"];
}

+ (YMNetResult *)defaultError{
    return [[YMNetResult alloc] initWithCode:Net_Error message:@"请求失败"];
}

+ (YMNetResult *)defaultNoNet{
    return [[YMNetResult alloc] initWithCode:Net_NoNet message:@"网络未连接"];
}

+ (YMNetResult *)defaultServerError{
    return [[YMNetResult alloc] initWithCode:Net_ServiceError message:@"无法连接到服务器"];
}

@end
