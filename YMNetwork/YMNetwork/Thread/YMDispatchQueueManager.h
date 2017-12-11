//
//  YMDispatchQueueManager.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YMDispatchQueueManager : NSObject

+ (dispatch_queue_t) getMainQueue;
+ (dispatch_queue_t) getConcrrentQueue;
+ (YMDispatchQueueManager *)getInstance;

@end
