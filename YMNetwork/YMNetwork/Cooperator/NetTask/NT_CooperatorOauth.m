//
//  NT_CooperatorOauth.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "NT_CooperatorOauth.h"
#import "Request_Oauth+sdk.h"
#import "Request_AccessToken+sdk.h"

@implementation NT_CooperatorOauth

- (instancetype)initWithClientId:(NSString *)clientId secret:(NSString *)clientSecret complete:(SimpleBlock)handler{
    self = [super init];
    if (self) {
        if (_cooperator == nil) {
            _cooperator = [[YMCooperator alloc] initWithId:clientId secret:clientSecret];
        }
        [self setOauthState];
        [YMInformationCenter getInstance].cooperator = _cooperator;
        _complete = handler;
        self.timeout = 10;
    }
    return self;
}
- (void)setOauthState{
    if (_cooperator.expireTime < [TimeUtils getCurrentTimeWithUnitSeconds]) {
        _cooperator.oauthCode = @"";
    }
}

- (void)perform{
    [self startOauth];
}

- (void)startOauth{
    Request_Oauth *request = [[Request_Oauth alloc] initWith:_cooperator];
    self.netTask = [YMNetManager oauth:request delegate:self];
    [self.netTask async];
}

- (void)oauthResult:(YMNetResult *)result response:(Response_Oauth *)response{
    if (result.result == Net_Ok) {
        _cooperator.oauthCode = response.code;
        _cooperator.orgId = response.orgId;
        _cooperator.expireTime = response.exprie_time/1000;
        [self setOauthState];
        if (_cooperator.oauthCode != nil && ![_cooperator.oauthCode isEqualToString:@""]) {
            [self getAccessToken];
        }else{
            [self error:result.msg];
        }
        
    }else{
        [self error:result.msg];
    }
}

- (void)getAccessToken{
    Request_AccessToken *request = [[Request_AccessToken alloc] initWith:_cooperator];
    self.netTask = [YMNetManager getAccessToken:request delegate:self];
    [self.netTask async];
}

- (void)accessTokenResult:(YMNetResult *)result response:(Response_AccessToken *)response{
    if (result.result == Net_Ok) {
        _cooperator.accessToken = response.access_token;
        _cooperator.tokenExpireTime = response.expires_in + [TimeUtils getCurrentTimeWithUnitSeconds];
        [YMNetManager setAccessToken:_cooperator.accessToken];
//        [self getConfigfile];
    }else{
        [self error:result.msg];
    }
}

//- (void)getConfigfile{
//    self.netTask = [YMNetManager getConfigFileWithClientId:_cooperator.clientId delegate:self];
//    [self.netTask async];
//}

- (void)callback{
//    [DBHelper_Cooperator insertOrUpdateCooperator:_cooperator];
    
    if (_cooperator.oauthCode != nil && ![_cooperator.oauthCode isEqualToString:@""]) {
        self.result = [YMResult getDefaultOkResult];
    }
    
    if (_cooperator.accessToken != nil && _cooperator.tokenExpireTime > [TimeUtils getCurrentTimeWithUnitSeconds]) {
        [YMNetManager setAccessToken:_cooperator.accessToken];
    }
    
    if (_complete != nil) {
        if (self.result.code == DfthRC_Error && ![YMNetManager isReachable]) {
            self.result.message = @"网络未连接";
        }
        _complete(self.result);
    }
}


@end
