//
//  YMRealTask.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMRealTask.h"
#import "YMRealNetManager.h"

@implementation YMRealTask{
    dispatch_block_t _timeoutBlock;
    dispatch_queue_t _queue;
    dispatch_semaphore_t _syncSignal;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.timeout = [YMRealNetManager defaultTimeout];
        self.result = [YMNetResult defaultError];
        _syncSignal = NULL;
    }
    
    return self;
}

- (void)async{
    if (_syncSignal == NULL && self.timeout != NEVER_TIMEOUT) {
        [self startAsyncTimer];
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self perform];
    });
}

- (void)perform{
    if (![YMRealNetManager isReachable]) {
        self.result = [YMNetResult defaultNoNet];
        [self finish];
        return ;
    }
    if ([YMRealNetManager isDebugMode]) {
        NSLog(@"self.baseUrl:%@ url = %@",[YMRealNetManager getBaseUrl],self.url);
        NSLog(@"request = %@", self.request.mj_keyValues);
    }else{
        NSLog(@"self.baseUrl:%@ url = %@",[YMRealNetManager getBaseUrl],self.url);
    }
    switch (_requestType) {
        case HTTP_GET:{
            self.netTask = [YMRealNetManager GET:self.url paraments:self.request.mj_keyValues completeBlock:^(NSDictionary *response, NSError *error) {
                [self handleNetError:error response:response];
                [self finish];
            }];
            break;
        }
        case HTTP_POST:{
            self.netTask = [YMRealNetManager POST:_url paraments:_request.mj_keyValues completeBlock:^(NSDictionary * _Nullable response, NSError * _Nullable error) {
                [self handleNetError:error response:response];
                //                NSLog(@"---------response:%@ ",response.mj);
                [self finish];
            }];
            break;
        }
        case HTTP_UPLOAD:{
            self.netTask = [YMRealNetManager Upload:_url data:_data progress:self.progressBlock completeBlock:^(NSDictionary * _Nullable response, NSError * _Nullable error) {
                [self handleNetError:error response:response];
                [self finish];
            }];
            break;
        }
        case HTTP_StreamUpload:{
            self.netTask = [YMRealNetManager streamUpload:_urlRequest progress:^(NSProgress * _Nonnull progress) {
                if (self.progressBlock != nil){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.progressBlock(progress);
                    });
                }
            } completionHandler:^(NSDictionary * _Nullable response, NSError * _Nullable error) {
                [self handleNetError:error response:response];
                [self finish];
            }];
            break;
        }
        case HTTP_Download:{
            self.netTask = [YMRealNetManager streamDownload:self.url filePath:self.filePath progress:^(NSProgress * _Nonnull progress) {
                if (self.progressBlock != nil){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.progressBlock(progress);
                    });
                }
            } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                //                NSLog(@"response=%@", response);
                [self handleNetError:error response:filePath];
                [self finish];
            }];
        }
        default:
            break;
    }
    
    [self.netTask resume];
}

- (void)finish{
    if (_syncSignal == NULL) {
        [self stopAsyncTimer];
        [self callback];
    }else{
        dispatch_semaphore_signal(_syncSignal);
    }
    
}

- (void)asyncTimeout{
    [self stopPerform];
    [self callback];
}


- (void)cancel{
    [self stopAsyncTimer];
    [self stopPerform];
}

- (void)startAsyncTimer{
    _queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timeoutBlock = dispatch_block_create(0, ^{
        [self asyncTimeout];
    });
    dispatch_time_t overTime = dispatch_time(DISPATCH_TIME_NOW, self.timeout * NSEC_PER_SEC);
    dispatch_after(overTime, _queue, _timeoutBlock);
}

- (void)stopAsyncTimer{
    if (_queue != NULL && _timeoutBlock != NULL) {
        dispatch_suspend(_queue);
        dispatch_block_cancel(_timeoutBlock);
        dispatch_resume(_queue);
        _timeoutBlock = NULL;
        _queue = NULL;
    }
}

- (void)handleNetError:(NSError *)error response:(NSDictionary *)response{
    
    if (error) {
        NSLog(@"error.code = %ld", (long)error.code);
        switch (error.code) {
            case NSURLErrorTimedOut:
                self.result.result = Net_Error;
                self.result.msg = @"请求超时";
                break;
            default:
                self.result = [YMNetResult defaultServerError];
                break;
        }
    }else{
        if ([self.url containsString:@"/zip/download"]) {
            self.result = [YMNetResult defaultOk];
            [self handlResponse:response];
        }else{
            _result = [YMNetResult mj_objectWithKeyValues:response];
            if (_result.result == 0) {
                if ([self.url containsString:@"oauth/"] && ![self.url containsString:@"/login"]) {
                    [self handlResponse:response];
                }else{
                    [self handlResponse:_result.data];
                }
            }else if ([_result.errcode isEqualToString:@"203002"]){ //创建心电时偶尔会出现该返回，已存在相同测量时间的数据
                NSLog(@"已存在相同测量时间的数据, 返回成功");
                _result.result = Net_Ok;
                [self handlResponse:_result.data];
            }else if ([_result.errcode isEqualToString:@"0"]){
                _result.msg = @"服务器异常,请稍后再试";
            }
        }
    }
    
    if ([YMRealNetManager isDebugMode]) {
        NSLog(@"%@ : response = %@", NSStringFromClass([self class]), response);
        if (_result.msg != nil) {
            NSLog(@"msg : %@", _result.msg);
        }
    }
}

- (void)stopPerform{
    [self.netTask cancel];
}

- (YMSyncResult *)sync{
    _syncSignal = dispatch_semaphore_create(0);
    [self async];
    
    //    dispatch_semaphore_wait(_syncSignal, DISPATCH_TIME_FOREVER /*self.timeout*NSEC_PER_SEC*/);
    if (dispatch_semaphore_wait(_syncSignal, dispatch_time(DISPATCH_TIME_NOW, self.timeout*NSEC_PER_SEC)) == 0){
        YMSyncResult *result = [[YMSyncResult alloc] init];
        result.netResult = _result;
        result.response = _response;
        return result;
    }else{
        YMSyncResult *result = [[YMSyncResult alloc] init];
        result.netResult.result = Net_Error;
        result.netResult.msg = @"请求超时";
        return result;
    }
}

- (void)handlResponse:(NSObject *)response{
    NSAssert(false, @"sub class should implement this method");
}

- (void)callback{
    NSAssert(false, @"sub class should implement this method");
}


@end
