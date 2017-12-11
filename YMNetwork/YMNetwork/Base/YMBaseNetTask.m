//
//  YMBaseNetTask.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMBaseNetTask.h"
#import "Request_AccessToken+sdk.h"

@implementation YMBaseNetTask

- (void)stopPerform{
    [self.netTask cancel];
}

- (void)netError:(YMNetResult *)result{
    if ([result.errcode isEqualToString:@"1001"]) {
        NSLog(@"TOKEN 过期, 重新获取token");
        [self getAccessToken];
    }else{
        [self error:result.msg];
    }
}

- (void)getAccessToken{
    Request_AccessToken *request = [[Request_AccessToken alloc] initWith:[YMInformationCenter getInstance].cooperator];
    self.netTask = [YMNetManager getAccessToken:request delegate:self];
    [self.netTask async];
}

- (void)accessTokenResult:(YMNetResult *)result response:(Response_AccessToken *)response{
    if (result.result == Net_Ok) {
        [YMInformationCenter getInstance].cooperator.accessToken = response.access_token;
        [YMInformationCenter getInstance].cooperator.tokenExpireTime = response.expires_in + [TimeUtils getCurrentTimeWithUnitSeconds];
        [YMNetManager setAccessToken:[YMInformationCenter getInstance].cooperator.accessToken];
//        [DBHelper_Cooperator insertOrUpdateCooperator:[DfthInformationCentre getInstance].cooperator];
        
        if ([self isRunning]) {
            [self perform];
        }
    }else{
        [self error:result.msg];
    }
}

@end
