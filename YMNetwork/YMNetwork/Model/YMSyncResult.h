//
//  YMSyncResult.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMNetResult.h"

@interface YMSyncResult : NSObject

@property (nonatomic, strong) YMNetResult *netResult;
@property (nonatomic, strong) __kindof NSObject *response;

@end
