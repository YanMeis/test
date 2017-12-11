//
//  YMBaseTask.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMTask.h"

@interface YMBaseTask : YMTask

@property(nonatomic, strong) YMResult *result;

- (instancetype)init;

- (void)finish;     //任务执行完毕,将会引起callback被调用

- (BOOL)isAsyncPerform;
- (void)perform;    //子类实现,开始执行功能
- (void)stopPerform;    //子类实现,停止执行功能
- (void)callback;   //子类实现，回调给SDK外部

- (void)ok:(NSString *)message;
- (void)error:(NSString *)message;

@end
