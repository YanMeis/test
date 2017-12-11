//
//  YMResult.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, DfthReturnCode)
{
    DfthRC_Ok = 0,
    DfthRC_Error,
    DfthRC_DoNothing,
};

@interface YMResult : NSObject

@property(nonatomic, assign)int code;
@property(nonatomic, copy)NSString *message;

- (instancetype)initWithCode:(int)code message:(NSString *)message;

+(YMResult *)getDefaultErrorResult;
+(YMResult *)getDefaultOkResult;
+(YMResult *)getDefaultDoNothing;

@end
