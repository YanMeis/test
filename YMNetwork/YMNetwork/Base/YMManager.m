//
//  YMManager.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMManager.h"
#import "NT_CooperatorOauth.h"

@implementation YMManager

+ (void)init
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //        [DfthInformationCentre getInstance].config = [DfthSDKConfig readLoaclConfigFile];
        
//        //初始化蓝牙中心
//        [DfthConnectService sharedInstance];
//
//        //初始化DDLog
//        [LogManager initDfthLogger];
//
//        //初始化数据库
//        [DfthDBManager setupDB2Path:[FileUtils getDfthDBPath] withName:@"DfthDB.db"];
//
//        //初始化数据库处理线程
//        [[DfthDBThread sharedInstance] run];
        
        //初始化网络
        [YMNetManager initWithNetworking];
        
        //监听网络状态的变化
        [YMNetManager appendNetStateDelegate:[YMInformationCenter getInstance]];
        
        //        NSTimeZone *zone = [NSTimeZone systemTimeZone]; // 获得系统的时区
        //        DDLogDebug(@"ZONE=%@", zone.name);
        
    });
}

+ (void)destroy
{
    [self destroy];
//    return [[DfthConnectService sharedInstance] destroy];
}

+ (YMTask *)getOauthTaskWithClientId:(NSString *)clientId clientSecret:(NSString *)clientSecret completeHandler:(SimpleBlock)handler{
     return [[NT_CooperatorOauth alloc] initWithClientId:clientId secret:clientSecret complete:handler];
}

@end
