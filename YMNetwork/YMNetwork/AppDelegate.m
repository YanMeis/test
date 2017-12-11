//
//  AppDelegate.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self initNetwork];
    
    return YES;
}


- (void)initNetwork{
    [YMManager init];
    
    [self oauth];
//    [self regist];
}

//- (void)regist{
//    YMTask *task = [YMManager getRegisterTaskWithAccount:@"13401111719" password:@"123456" verifyCode:@"235347" completeHandler:^(YMResult * _Nonnull result, User * _Nonnull user) {
//        if (result.code == DfthRC_Ok) {
//            NSLog(@"注册成功");
//        }else{
//            NSLog(@"注册失败:%@",result.message);
//        }
//    }];
//    [task async];
//}

- (void)oauth{
    // 9e412aa2bef94d199cdacef7f1f6240c     feaa94d9701b42899bce6cfeed0e860e 正事
    // b04bb81daa5047bc9f2554956e1d2b4c    b996c7f022f64c70a6c82ede97a3f30a 测试
    [GlobleData sharedInstance].clientId = @"b04bb81daa5047bc9f2554956e1d2b4c";
    [GlobleData sharedInstance].clientSecret = @"b996c7f022f64c70a6c82ede97a3f30a";
    YMTask *task = [YMManager getOauthTaskWithClientId:[GlobleData sharedInstance].clientId clientSecret:[GlobleData sharedInstance].clientSecret completeHandler:^(YMResult *result){
        if (result.code == DfthRC_Ok) {
            NSLog(@"认证成功");
//            [self regist];
        }else{
            NSLog(@"认证失败：%@",result.message);
        }
    }];

    //    task.timeout = 10;
    [task async];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
