//
//  YMNetManager.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMNetManager.h"
#import "YMNetTask_Oauth.h"
#import "YMNetTask_AccessToken.h"
#import "Request_MemberRegist.h"
#import "Delegate_MemberRegist.h"
#import "NetTask_MemberRegist.h"

@implementation YMNetManager

+ (void)initWithNetworking{
    [YMRealNetManager initWithNetworking];
}

+ (void)setAccessToken:(NSString *)token{
    [YMRealNetManager setAccessToken:token];
}

+ (void)appendNetStateDelegate:(id<YMNetStateDelegate>)delegate{
    [YMRealNetManager appendNetStateDelegate:delegate];
}

+ (void)removeNetStateDelegate:(id<YMNetStateDelegate>)delegate{
    [YMRealNetManager removeNetStateDelegate:delegate];
}

+ (NetworkStatus)getNetworkStatus{
    return [YMRealNetManager getNetworkStatus];
}

+ (BOOL)isReachable{
    return [YMRealNetManager isReachable];
}

+(YMNetTask *)oauth:(Request_Oauth *)request delegate:(id<Delegate_Oauth>)delegate{
    return [[YMNetTask_Oauth alloc] initWith:request delegate:delegate];
}

+ (YMNetTask *)getAccessToken:(Request_AccessToken *)request delegate:(id<Delegate_AccessToken>)delegate{
    return [[YMNetTask_AccessToken alloc] initWith:request delegate:delegate];
}

+ (YMNetTask *)memberRegist:(Request_MemberRegist *)request delegate:(id<Delegate_MemberRegist>)delegate{
    return [[NetTask_MemberRegist alloc] initWith:request delegate:delegate];
}

@end
