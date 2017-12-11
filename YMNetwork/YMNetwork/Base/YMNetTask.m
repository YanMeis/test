//
//  YMNetTask.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMNetTask.h"

@implementation YMNetTask

- (void)async{
    NSAssert(false, @"sub class should implement this method");
}

- (void)cancel{
    NSAssert(false, @"sub class should implement this method");
}

- (YMSyncResult *)sync{
    NSAssert(false, @"sub class should implement this method");
    return nil;
}

@end
