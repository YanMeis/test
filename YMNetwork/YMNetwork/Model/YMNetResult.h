//
//  YMNetResult.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, DfthNetCode)
{
    Net_Ok = 0,
    Net_Error,
    Net_NoNet,
    Net_ServiceError,
    Net_NOEcg,
};

@interface YMNetPage : NSObject
@property (nonatomic, assign) int pageNum;
@property (nonatomic, assign) int pageSize;
@property (nonatomic, assign) int total;
@property (nonatomic, assign) int pages;
@end

@interface YMNetResult : NSObject
@property (nonatomic, assign) int result;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) YMNetPage *page;
//@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) NSObject *data;
@property (nonatomic, copy) NSString *errcode;


+(YMNetResult *)defaultOk;
+(YMNetResult *)defaultError;
+(YMNetResult *)defaultNoNet;
+(YMNetResult *)defaultServerError;

@end
