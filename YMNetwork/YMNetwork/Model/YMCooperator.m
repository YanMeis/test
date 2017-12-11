//
//  YMCooperator.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMCooperator.h"

@implementation YMCooperator

- (instancetype)initWithId:(NSString *)clientId secret:(NSString *)clientSecret
{
    if (self = [super init]) {
        _clientId = clientId;
        _clientSecret = clientSecret;
        //        _accessToken = @"";
        //        _oauthCode = @"";
        //        _orgId = @"";
    }
    return self;
}

#if 0
- (instancetype)initWithCooperator:(Cooperator *)cooperator
{
    self = [super init];
    if (self) {
        _clientId = cooperator.clientId;
        _clientSecret = cooperator.clientSecret;
        _oauthCode = cooperator.oauthCode;
        _orgId = cooperator.orgId;
        _oauthStatus = cooperator.oauthStatus;
        _serviceStatus = cooperator.serviceStatus;
        _expireTime = cooperator.expireTime;
        _accessToken = cooperator.accessToken;
        _tokenExpireTime = cooperator.tokenExpireTime;
        if (_expireTime > [TimeUtils getCurrentTimeWithUnitSeconds]) {
            _serviceStatus = DfthRC_Error;
        }
    }
    return self;
}
#endif

- (BOOL) isNeedService{
    return _serviceStatus == 2;
}

- (BOOL)isOauthOK{
    return _oauthCode != nil;
}

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if (oldValue == nil) {
        return @"";
    }else{
        return oldValue;
    }
}

@end
