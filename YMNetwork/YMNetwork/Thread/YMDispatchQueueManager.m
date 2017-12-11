//
//  YMDispatchQueueManager.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMDispatchQueueManager.h"

@implementation YMDispatchQueueManager

+ (dispatch_queue_t) getMainQueue{
    return dispatch_get_main_queue();
}

+ (dispatch_queue_t) getConcrrentQueue{
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
}

+ (YMDispatchQueueManager *)getInstance{
    static YMDispatchQueueManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YMDispatchQueueManager alloc] init];
    });
    
    return instance;
}

@end
