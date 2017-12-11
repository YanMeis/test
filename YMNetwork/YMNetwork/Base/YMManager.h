//
//  YMManager.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YMManager : NSObject

/**
 * 程序启动后需要立即调用此接口初始化sdk，建议放在AppDelegate中调用
 */
+ (void)init;

/**
 * 销毁 DfthSDKManager
 */
+ (void)destroy;

+ (YMTask*)getOauthTaskWithClientId:(NSString *)clientId clientSecret:(NSString *)clientSecret completeHandler:(SimpleBlock)handler;
///**
// * 委托监听蓝牙状态变化
// *
// * @param delegate 接收状态变化的回调
// *
// */
//+ (void)appendBluetoothStateDelegate:(id<YMBluetoothStateDelegate>)delegate;
//
///**
// * 取消监听蓝牙状态变化
// *
// * @param delegate 被移除的回调
// *
// */
//+ (void)removeBluetoothStateDelegate:(id<YMluetoothStateDelegate>)delegate;
//
///**
// * 查询手机蓝牙状态
// *
// *
// * @return true 手机蓝牙开启, false 手机蓝牙关闭
// */
//+ (BOOL)isBluetoothAdapterOn;

@end
