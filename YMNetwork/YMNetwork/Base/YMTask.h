//
//  YMTask.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NEVER -1

@interface YMTask : NSObject

@property(nonatomic, assign) int timeout;
@property(atomic, assign, getter=isRunning) BOOL running;

- (void)async;
- (void)cancel;

@end
