//
//  YMNetManager.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMNetTask.h"

#import "Request_Oauth.h"
#import "Request_AccessToken.h"
#import "Request_MemberRegist.h"

#import "Delegate_Oauth.h"
#import "Delegate_AccessToken.h"
#import "Delegate_MemberRegist.h"

@interface YMNetManager : NSObject

+ (void)initWithNetworking;
+ (void)setAccessToken:(NSString *)token;
#pragma mark 网络状态代理
+ (void)appendNetStateDelegate:(id<YMNetStateDelegate>)delegate;
+ (void)removeNetStateDelegate:(id<YMNetStateDelegate>)delegate;
+ (NetworkStatus)getNetworkStatus;
+ (BOOL)isReachable;

#pragma mark 认证
+ (YMNetTask *)oauth:(Request_Oauth *)request delegate:(id<Delegate_Oauth>)delegate;
+ (YMNetTask *)getAccessToken:(Request_AccessToken *)request delegate:(id<Delegate_AccessToken>)delegate;

#pragma mark 用户
//+ (YMNetTask *)memberLogin:(Request_MemberLogin *)request delegate:(id<Delegate_MemberLogin>)delegate;
+ (YMNetTask *)memberRegist:(Request_MemberRegist *)request delegate:(id<Delegate_MemberRegist>)delegate;

@end
