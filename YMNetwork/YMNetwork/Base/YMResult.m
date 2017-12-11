//
//  YMResult.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMResult.h"

@implementation YMResult

- (instancetype)initWithCode:(int)code message:(NSString *)message{
    self = [super init];
    if (self) {
        _code = code;
        _message = message;
    }
    return self;
}

- (NSString *)description{
    return self.mj_JSONString;
};

+(YMResult *)getDefaultErrorResult{
    YMResult *result = [[YMResult alloc] init];
    result.code = DfthRC_Error;
    result.message = @"任务执行失败";
    
    return result;
}
+(YMResult *)getDefaultOkResult{
    YMResult *result = [[YMResult alloc] init];
    result.code = DfthRC_Ok;
    result.message = @"任务执行成功";
    
    return result;
}

+(YMResult *)getDefaultDoNothing{
    YMResult *result = [[YMResult alloc] init];
    result.code = DfthRC_DoNothing;
    result.message = @"无操作";
    
    return result;
}

@end
