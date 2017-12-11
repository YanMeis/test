//
//  YMRealTask.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMNetTask.h"
#import "YMRealNetManager.h"
#import "YMNetResult.h"

#define NEVER_TIMEOUT -1

@interface YMRealTask : YMNetTask

@property(nonatomic, copy) NSString *url;   //子类必须赋值
@property(nonatomic, strong) __kindof NSObject *request;    //子类必须赋值
@property(nonatomic, strong) __kindof NSObject *response;   //子类应该赋值
@property(nonatomic, strong) NSData *data;  //上传任务时，子类必须赋值，需要上传的数据
@property(nonatomic, strong) NSMutableURLRequest *urlRequest;
//@property(nonatomic, strong) NSURLSessionDataTask *netTask;
@property(nonatomic, strong) NSURLSessionTask *netTask;

@property(nonatomic, assign) HTTPRequestType requestType;   //子类必须赋值
@property(nonatomic, strong) NSString *filePath;
@property(nonatomic, strong) NetProgressBlock progressBlock;

@property(nonatomic, strong) YMNetResult *result;

//- (void)handleNetError:(NSError *)error response:(NSDictionary*)response;   //处理网络返回

//- (void)finish;     //任务执行完毕,将会引起callback被调用

//- (void)perform;    //子类实现,开始执行功能
//- (void)stopPerform;    //子类实现,停止执行功能
- (void)handlResponse:(NSObject *)response;   //子类实现，回调给SDK外部
- (void)callback;

@end
