//
//  YMInformationCenter.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMInformationCenter.h"

@implementation YMInformationCenter

+ (YMInformationCenter *)getInstance{
    static YMInformationCenter *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YMInformationCenter alloc] init];
    });
    
    return instance;
}

//+ (BOOL)canTransportFiles{
//    if ([[YMInformationCenter getInstance].config.ecgConfig.ecgUploadConfig isTransportFilesOnlyWifi] == false) {
//        return true;
//    }else if ([YMNetManager getNetworkStatus] == NRS_WiFi){
//        return true;
//    }else{
//        return false;
//    }
//}
//
//- (void)netStateChangeFrom:(NetworkStatus)oldState to:(NetworkStatus)newState{
//    if (newState == NRS_WWAN || newState == NRS_WiFi) {
//        NT_CooperatorOauth *task = [[NT_CooperatorOauth alloc] initWithClientId:_cooperator.clientId secret:_cooperator.clientSecret complete:^(DfthResult * _Nonnull result) {
//            if (result.code == DfthRC_Ok) {
//                DDLogDebug(@"网络恢复，认证成功");
//            }else{
//                DDLogDebug(@"网络恢复，认证失败");
//            }
//        }];
//
//        [task async];
//    }
//}
@end
