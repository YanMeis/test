//
//  YMNetTask.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMSyncResult.h"

@interface YMNetTask : NSObject

@property (nonatomic, assign) int timeout;

- (void)async;
- (void)cancel;
- (YMSyncResult *)sync;

@end
