//
//  YMBaseTask.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMBaseTask.h"
#import "YMDispatchQueueManager.h"

@implementation YMBaseTask{
    dispatch_block_t _timeoutBlock;
    dispatch_queue_t _queue;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        //        DDLogDebug(@"%@ : %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
        self.timeout = 3;
        self.result = [YMResult getDefaultErrorResult];
        self.running = false;
    }
    
    return self;
}

- (void)async{
    //    DDLogDebug(@"%@ : %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    if (self.running == true) {
        NSLog(@"EcgUploader已经在运行，退出: %@", self);
        return;
    }else{
        self.running = true;
    }
    if (self.timeout != NEVER) {
        [self startAsyncTimer];
    }
    if([self isAsyncPerform]){
        [self perform];
    }else{
        dispatch_async([YMDispatchQueueManager getConcrrentQueue], ^{
            [self perform];
        });
    }
}

- (void)asyncTimeout{
    //    DDLogDebug(@"%@ : %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    self.running = false;
    [self stopPerform];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self callback];
    });
}

- (void)finish{
    //    DDLogDebug(@"%@ : %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [self stopAsyncTimer];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self callback];
    });
    self.running = false;
}

- (void)cancel{
    //    DDLogDebug(@"%@ : %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    self.running = false;
    [self stopAsyncTimer];
    [self stopPerform];
}

- (void)startAsyncTimer{
    //    DDLogDebug(@"%@ : %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    
    NSString *queueName = [NSString stringWithFormat:@"com.dfth.sdk.%@", NSStringFromClass([self class])];
    _queue = dispatch_queue_create([queueName UTF8String], DISPATCH_QUEUE_CONCURRENT);
    _timeoutBlock = dispatch_block_create(0, ^{
        [self asyncTimeout];
    });
    dispatch_time_t overTime = dispatch_time(DISPATCH_TIME_NOW, self.timeout * NSEC_PER_SEC);
    dispatch_after(overTime, _queue, _timeoutBlock);
}

- (void)stopAsyncTimer{
    if (_queue != NULL && _timeoutBlock != NULL) {
        //        DDLogDebug(@"%@ : %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
        dispatch_suspend(_queue);
        dispatch_block_cancel(_timeoutBlock);
        dispatch_resume(_queue);
        _timeoutBlock = NULL;
        _queue = NULL;
    }
}

- (BOOL)isAsyncPerform{
    return true;
}

- (void)perform{
    NSAssert(false, @"this method should implement by sub class");
}

- (void)callback{
    NSAssert(false, @"this method should implement by sub class");
}

- (void)stopPerform{
    NSAssert(false, @"this method should implement by sub class");
}

- (void)ok:(NSString *)message{
    self.result.code = DfthRC_Ok;
    self.result.message = message;
    [self finish];
}

- (void)error:(NSString *)message{
    self.result.code = DfthRC_Error;
    self.result.message = message;
    [self finish];
}


@end
